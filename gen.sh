#! /bin/sh

# Convert the (unformatted file) to have line wraps for easier viewing in
# terminal

# Remove the original file
rm LuaGuideFormatted.md

# Parse through the file, using "```" as the record separator

awk -v RS='```' '
BEGIN {
	inblock = 1; # Indicates if a code block is being processed or not
	started = 0; # If the first line is not a code block, it is cut
                     # off. This keeps that from happening.
}
{ inblock = !inblock } # Iterations alternate between code blocks and text
{
	if ( inblock ) {
		# Code blocks are not formatted, so just output them
		print "```" $0 "```" >> "LuaGuideFormatted.md"
	}
	else {
		# Format the text:
		# Remove the last line (whitespace) from the heredoc
		# which contains the match. A quoted heredoc is used to
		# keep quotes and backticks from messing up the command.
		system( "( head -n -1 << \"EndOfHereDocument\"\n" $0 \
		"\nEndOfHereDocument\n )" \
		( ( started == 1 ) ? "| tail -n +2" : "" ) \
		"| fmt -s -w 75 >> LuaGuideFormatted.md" )
		# Cut the first couple lines if it is not the first match,
		# then format the text
	}
	started = 1
}' LuaGuide.md

# Create the HTML file
pandoc -s --number-sections --toc -o LuaGuide.html LuaGuide.md
