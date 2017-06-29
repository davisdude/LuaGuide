# An Introduction to Lua





## Introduction

### Purpose

The purpose of this guide is to take a person who knows little/nothing about
programming and to teach them Lua (version 5.2, though all versions numbered
with a '5' as the first number should be virtually the same). By the end of the
tutorial, the reader should be able to read and write Lua with general ease.

### Why Lua?

You may be wondering: "Why should I learn Lua?" There are several features of
Lua that make it ideal as a first language:

- Lua is a small language. This means that it has very few built-in commands.
  While this may not seem like an advantage at first, there are a few reasons
  why this is beneficial:

	- It makes the language easier to learn.
	- It reinforces concepts. Because many aspects that other languages
	  have are not present by default in Lua, you gain a better
	  understanding of how the concept works by implementing it yourself.

- Lua is more forgiving than many languages. Many languages feature complex and
  confusing processes, such as "static typing" and "compiling." These can be
  confusing for first-time users. Because Lua does not feature these concepts,
  there will be at no point a concept where the reader is told to "Just trust
  me" (though I will delay explaining some topics fully until later in order to
  avoid confusion). Throughout this tutorial I will make an effort to explain
  not only how, but also why things are the way they are.

- Installing Lua is very simple and straightforward.

### Installing and Configuring an Editor

In order to edit code, you need something called a **text editor**. An editor
is what you use to write your code. Editors can be as simple or complex as you
would like them to be. You can even use Notepad to edit your Lua files, though
I would **strongly** advise against this for several reasons. Primarily, it
lacks syntax highlighting, which makes your code easier to read. It also lacks
an advanced undo structure, which severely limits your ease-of-use. For most
entry-level users, I recommend installing
[Notepad++](http://notepad-plus-plus.org), as it is free, extremely
straight-forward, and easy to use and install.

To make editing your files easier, change the **filetype association** for
`.lua` files to make them open with Notepad++, that way you can easily
double-click the file to open and edit it. The file type association tells your
computer what program to use to open files with that extension. For instance,
the file type association for `.docx` files is Microsoft Word.  To change the
file type association, you need to do a few things:

1. View file extensions. You need to be able to view file extensions because it
   makes creating Lua files easier. To do this:

	- Open the file explorer
	- Select `View`
	- Click the box labeled `File name extensions`

1. Create a file called `test.lua`. You need to create a Lua file in order to
   change the file type association. To do this:

	- Right click within the file explorer
	- Select the option `New`
	- Select `Text Document`
	- Give the file the name `test.lua`
	- When prompted if you want to change the file type, select "Yes"

1. Change the filetype association for `.lua` files. To do this:

	- Right-click on `test.lua`
	- Select the option "Properties"
	- Select "Opens With"
	- Select "Change"
	- Select "Show More Apps"
	- Select "Browse for the App"
	- Navigate to the directory where Notepad++ installed (probably
	  `C:\Program Files (x86)\Notepad++`) and choose the `.exe` file.

Now you should be able to open a Lua file with Notepad++ by double-clicking it.
Test this by double-clicking the `test.lua` file you created earlier. It should
now open with Notepad++.

### Command Line Basics

The command line is an essential part of programming. While full knowledge of
the command line is not needed, a basic knowledge is necessary. Essentially,
the command line is like an extremely basic file-explorer that uses commands
instead of using the mouse.

To open the command prompt, either:

- Open the file-explorer and `shift + right-click`, then choose the option
  that says, "Open command window here".

- Click start (in the lower left-hand corner) and select `Run`. From there,
  type in `cmd`.

Just like the file-explorer, you can only work with one folder, or
**directory** at a time. The directory that you're working with, also known as
the **current directory**, is always displayed to the left of the `>` on the
command prompt.

To view the contents of the current directory, use the command
`dir`, which is short for **dir**ectory. This outputs all the files and
directories within the current directory. You may notice there are two somewhat
odd directories: "`.`" and "`..`". "`.`" represents the current directory,
while "`..`" represents the **parent directory**, or the directory that
contains the current directory.

To change the current directory, use the command `cd NEWDIR`, where `NEWDIR` is
the name of the new directory. `cd` stands for **c**hange **d**irectory. For
instance, if you want to go up a level, type `cd ..`. Now, when you type `dir`,
the previous current directory should now be visible as a directory.

If you don't understand this, don't worry: In the first section there will be a
guided example of how to do this.

### Installing Lua (for Windows)

Visit the [Lua website](http://lua.org) and follow the label that says
"Download," then click "Binaries" at the top of the page (**not** the one
towards the bottom of the page). Next, select the "Download" link on the left.
Then scroll down to "LuaBinaries 5.2.4" and choose the file labeled something
along the lines of `lua-5.2.4_WinXX_bin.zip`, where `XX` is either 64 or 32.
This number represents the architecture of your computer. Most modern computers
are 64 bits, though if you aren't sure, download the 32 bit one for now.

Extract the `.zip` file and move the extracted directory to `C:\Program Files`
if you installed the 64 bit one, or `C:\Program Files (x86)` if you installed
the 32 bit one. The reasoning behind this is somewhat complex, but, basically,
there are two predominant architectures: 32 and 64 bit. The `(x86)` specifies
that the file is 32 bits.

Navigate to the directory where Lua was installed with the file-explorer and
remove the `52` from the end of `lua52.exe`. This was included in the name by
default because it makes it easier to work with multiple versions of Lua.
Because we are only working with one version, however, it is simpler for now if
we remove that from the name. Now try double-clicking `lua.exe`. It should open
up Lua in what is called **interactive mode**. It should look like this:

```
Lua 5.2.4  Copyright (C) 1994-2017 Lua.org, PUC-Rio
>
```

This is just information about the Lua version you're using and who developed
it (PUC-Rio). Now you can run Lua commands! To exit this, close the window to
the command prompt.

You can also run Lua by typing `"PATH\lua"` into your command line, where
`"PATH"` is the path to your Lua executable (usually something like
`C:\Program Files\lua-5.2.4\lua` or similar) surrounded by quotes.
You can run Lua files by typing into your command line `"PATH\lua" file.lua"`
where `file.lua` is the file you would like to execute. You can also enter
interactive mode by typing `"PATH\lua"`. This should bring up the same
information that you saw before. To exit, either hit `Control-c` or close the
window.

This is great, but it's a real hassle to have to type that whole directory
every single time.  Thankfully, there's a way to avoid doing that: add the
directory to your `PATH`. `PATH` is an environment variable that contains
directories to look through whenever a command is given. For instance, if you
type just `lua` into your command prompt now, you will get an error about an
unrecognized command (as long as you are **not** in the directory where
`lua.exe` is located). This is because `lua.exe` is not located in any of your
`PATH` directories. To fix this:

- Open the Control Panel

- Click on the tab "System and Security"

- Click on the heading "System"

- Click on the side-menu "Advanced System Properties"

- Choose "Environment Variables"

- Find the bottom part, labeled "System Variables"

- Click on `Path`, then `Edit`, then `New` and type (or paste) the `"PATH"`
  directory from earlier.

Now, you should be able to type `lua` on your command prompt and see the same
screen you saw before.

### Format of this Guide

Each sections is composed of two parts: **Instruction** and **Exercises**. In
the instruction part, commands are entered through Lua's interactive mode. In
the exercises part, a file is written and run through the command line like so:

```
lua FILENAME
```

Where `FILENAME` is the name of the Lua file you are running. For instance, if
your filename is `test.lua`, the command you would enter (while in the
current directory of the Lua file `test.lua`) would be `lua test.lua`. This
executes the file and shows its output in the command prompt.





## Variables

Variables contain values. These values can be of several types: `strings`,
`numbers`, `booleans` and more. The type of a variable represents how it can
be used and what it is used for. Variables are the building blocks of all good
code and are an extremely important concept to understand.

### Variable Names and Comments

Variables in Lua can be any series of letter or numbers, as long as they don't
start with a number (the reasoning for this will be given later). Variables can
also contain underscores, but no other special characters. This is because most
of these characters are operators, such as addition or subtraction. The
following are all *valid* variable names (note that you should **not** run the
following in the interpreter):

```lua
variable
name123
this_name
luaIsAwesome
```

The following are all **not** valid variable names (you should **not** run this
section either):

```lua
2songName      -- Variables cannot start with numbers
this variable  -- Variables cannot have spaces
lua-is-awesome -- Variables can only have underscores, letters, and numbers
```

You may have noticed the "`--`" above. These are called **single-line** or
**one-line comments**. Anything after these two dashes is ignored by the
interpreter. Comments can be used to document your code. The space after `--`
does not have to be present, though I prefer the way it looks with it.

You can also do **multi-line comments**, which are like comments, but span
multiple lines. They are opened with "`--[[`" and closed with "`]]`". Note that
with multi-line comments, there must be **no** space between `--` and `[[`. You
can use multi-line comments, for example, to make notes about valid variable
names. Open up the command line and type `lua` to go into interactive mode and
type the following:

```lua
--[[
Valid variable names:
---------------------
variable
name123
this_name
luaIsAwesome

Invalid variable names:
-----------------------
2songName      -- Variables cannot start with numbers
this variable  -- Variables cannot have spaces
lua-is-awesome -- Variables can only have underscores, letters, and numbers
]]
```

Notice how nothing happens when you finish. That is because you aren't doing
anything yet. Remember, comments are ignored by the interpreter, so this is
essentially the same as just hitting enter.

In the above examples, you may have noticed that there are many ways to format
variable names. There are two prevailing ways to separate words:

```lua
variableNamesLikeThis

-- or

variable_names_like_this
```

The first is called `camelCase` and the second is called `snake_case`. In this
tutorial I will use camel case simply because I prefer it, though both methods
are perfectly valid.

Note that capitalization **does** matter: `thisVariable` is different from
`THISVARIABLE` and so on.

Variable names should be short but descriptive. The descriptive part is of more
importance than the short part, however. Your variable name needs to be
descriptive to help you remember the purpose of the variable. When in doubt, go
with verboseness over conciseness. This will save you headaches in the long
run, by keeping you from having to search all over the place for what your
variable represents.

### Assigning and Accessing Variables

You **assign** variables with an equal sign. Assigning a variable just means
that you are giving the variable a value.  Variable assignment looks like this:

```lua
variableName = value
```

**Accessing** variables is done by referencing the name of the variable. For
instance, if you wanted to view the value of a variable, you would do so like
so (enter this into the Lua command line):

```lua
variableName = 5
print( variableName ) -- 5 (You do not need to write comments)
```

The `print` command is used to show the output of values and is part of Lua's
**standard library**. It is called a **function**. A function is something that
will be explained more later, but essentially it is used to make programming
easier.

### Variable Types

In (virtually) all programming languages, variables have what are called
"types." The type of a variable dictates what the variable is used for. There
are several types of variables, but the most common are `numbers` `strings`,
and `booleans`.

#### Numbers

In the above example, `variableName` must conform to the variable naming
specifications (see [Variable Names and Comments](#variable-names-and-comments)
for more) and `value` can be virtually anything. For instance, if you wanted to
assign a variable to the value of pi, you could do:

```lua
pi = 3.14
print( pi ) -- 3.14
```

In this example, the variable assigned is a **number**. As mentioned before,
there are many types of values a variable can store, and each type has
different uses. Numbers, for instance, are used for mathematical operations.

Numbers can be stored in many different formats. For instance, if you wanted to
represent a number in scientific notation, you could do the following:

```lua
speedOfLight = 3e8

-- or

speedOfLight = 3E8

print( speedOfLight ) -- 300000000
```

Numbers can also be stored in hexadecimal with the following notation:

```lua
fourteen = 0xE
fourteen = 0XE
print( fourteen ) -- 14
```

Note that hex numbers **must** be preceded with `0x` or `0X`. This is the
representation used to store hexadecimal numbers, as well as part of the reason
that variable names in Lua cannot be started with numbers, as there would be
ambiguity as to whether you are referencing a number or assigning a variable.

You can also perform operations and store those values as numbers. For
instance:

```lua
pi = 3.14
r = 1
area = pi * r ^ 2
print( area ) -- 3.14
```

Note that numbers are evaluated in the same way that you follow order of
operations, though parenthesis can be used for clarity if desired.

You can also use a variable in its own assignment if it already has a value.
For instance, increasing a number by one is called **incrementing** and
decreasing a variable by one is called **decrementing**. This is done like so:

```lua
numberOfSongs = 3

-- Later, say when a song is added:
numberOfSongs = numberOfSongs + 1
print( numberOfSongs ) -- 4
```

#### Strings

The `string` type is used to store characters. They're called `strings` because
they contain a "string," or series of characters. The name is somewhat
confusing, but their usage isn't.  They're used to store virtually any
information that won't be used as a number or in mathematical operations.
Strings are surrounded by single quotes or double quotes. The following are all
strings:

```lua
state = "North Carolina"
country = 'United States of America'

print( state ) -- North Carolina
print( country ) -- United States of America
```

Note that you must open and close the string with the same type of quote. Both
formats are valid, though I prefer to use single quotes because they're easier
to type, so that is what I will use throughout the tutorial.

It is possible to mix single and double quotes, like so:

```lua
sentance = 'She said "No way Jose!"'
response = "I said \"Yes way Jose!\""

print( sentance ) -- She said "No way Jose!"
print( response ) -- I said "Yes way Jose!"
```

Note the `\"` in the second example. This is called "escaping" and is used to
contain double quotes in a string surrounded by double quotes. Basically, what
these do is tell Lua that these quotes are part of the string and do not
represent the end of the string. Note that, because we used single quotes in
the first example, there was no need to escape the double quotes (though
escaping the double quotes there wouldn't be wrong). Single quotes can also be
escaped.

Just as there are operators you can do on numbers, there are operators you can
use on strings. You can combine strings with the "`..`" operator. This is
called **concatenating** strings. You can concatenate multiple strings at once.

```lua
part1 = 'this'
part2 = 'is'
part3 = 'a'
part4 = 'test'

sentance = part1 .. ' ' .. part2 .. ' ' .. part3 .. ' ' .. part4
print( sentance ) -- this is a test
```

Note that strings can be concatenated even if they are not already assigned to
a variable, as shown in the above demonstration, where the variables have
already been assigned while the spaces (`' '`) have not.

#### Multi-Line Strings

Just as comments can be multiple lines, strings can also be multiple lines. The
syntax for multi-line strings is very similar to multi-line comments. Recall
that multi-line comments look like so:

```lua
--[[
This is a
multi-line comment
]]
```

This is what multi-line strings look like:

```lua
mutliLineString = [[
This text is part of
a multi-line string.

You can use both "double"
and 'single quotes'
without worrying
]]

print( multiLineString )
```

Note that the line after `without worrying` **is** present. To get rid of this
extra line, simply put the `]]` on the same line as `without worrying`. Also
note that the first line after `[[` is ignored.

#### Booleans

If numbers store numbers and strings store strings of characters, what do
booleans store? Booleans store values that represent "thruthiness." Booeleans
have two values: `true` or `false`.

```lua
luaMaster = false
luaLearner = true

print( luaMaster ) -- false
print( luaLearner ) -- true
```

Booleans are useful when dealing in absolutes. For instance, if you had a
variable `carIsRunning`, you would probably use a boolean to represent if the
car is running or not, because the car can either be on or off. A car cannot be
between running and not running; that's not possible. Similarly, something that
a variable represents may only be in two states. Booleans are used to represent
these variables.

#### Nil

Nil is a special type of value in Lua. It is the value used when a variable is
not assigned. For instance, take the example below:

```lua
Index = 1
print( index ) -- nil
```

Note here that the variable assigned is `Index`, while the variable accessed is
`index`. Because these are different variables (remember: capitalization
matters), `index` has not been assigned, so it has no value. So, `nil` is the
value given to variables who have not been assigned.

You may be wondering: Why is this useful? Why can't Lua just figure out what
variable I'm going for instead of being so pedantic? Because you don't want
your programming language to try to "figure out" anything; it should do
**only** what you tell it to. This is because you can get hard to find errors
if the program thinks you're trying to type one thing and you mean another.

Additionally, having the `nil` value is useful for several somewhat complex
reasons. These will be explained more later, but what you need to know now is
that it allows you to check if a variable has been assigned or not.

### Why would I want to use variables?

Variables are extremely useful and are the building blocks for a program.
Variables hold many benefits for programmers:

- Variables make  your code easier to read and understand. Variables are more
  descriptive than just numbers or strings. You may not know exactly what
  `d = 6.28 * r` means or does, but you know exactly what it represents in the
  example below:

```lua
pi = 3.14
tau = 2 * pi
radius = 5
diameter = tau * radius
```

- Variables make changing your code easier. For instance, say your program
  gets the area and circumference of a circle. This is what your program looks
  like:

```lua
radius = 3
area = 3.14 * radius ^ 2
circumference = 2 * 3.14 * radius
```

- What happens if you decide you want more precision with your results? You
  would be forced to change every occurrence of `3.14` with whatever the new
  value is. Of course, in this example, that's only two times. But you can
  imagine how much of a pain it would be in an actual program. It's easier to
  use a variable for `pi`, and to just change that one value instead of every
  individual value, avoiding wasted time and frustration.

In summary, variables:

- Make your code easier to read
- Make changes easier and faster

#### Strings vs Numbers

You may have noticed that strings can store numbers. This may have caused you
to ask yourself, "How do I decide if I should use a number or a string?" The
answer is "It depends." For a simple answer, numbers that you will be doing
mathematical calculations with should be `numbers`, while numbers that will
only be stored or displayed should be `strings`. For instance, a phone number
would usually be stored as a `string`, as no calculations will be done with a
phone number. On the other hand, a person's age would probably be stored as a
`number`, as, at the very least, it will need to be incremented.

### Exercises

In this section, you will create a file that should act as your notes. Feel
free to add comments liberally to document what it is you're doing and why. I
recommend making a directory on your `Desktop` called "Lua" or something really
clever like that. Within that directory, make a text document called something
like `01 Variables and Comments.lua`. Next, open the file with Notepad++ and
add the following to the file:

```lua
info1 = 'This is a string'
info2 = 'Strings can store letters and numbers'

print( info1 )
print( info2 )
```

Next, bring a command prompt to that location. To do this:

1. open up a command prompt and type `cd \`. This will set the current
   directory to `C:\`.

1. View the contents of the directory. Type `dir` to view the contents. If you
   didn't know, the location of your Desktop directory is
   `C:\Users\USERNAME\Desktop`, where `USERNAME` is obviously (hopefully) your
   username. So when you type `dir`, you should see `Users` as one of the
   directories. Type `cd Users` to set the current directory to `C:\Users\`.

1. Type in `dir` again to view the users on your system. `cd` into your
   username.

1. Type `dir` again to view the directories in `C:\Users\USERNAME\`. You should
   see a directory called `Desktop`. `cd` into it.

1. Type `dir` to view the contents of your desktop. You should see your `Lua`
   directory there. `cd` into it.

1. Type `dir` one last time. You should see the file you created.

1. Type `lua "01 Variables and Comments.lua"`. Note that the quotes **are**
   required. You can also press `tab` whenever you're typing the name and, if
   the name can be auto-completed, the name will be filled in. For instance, if
   you type `lua 01` and press `tab`, the name should automatically be
   completed, with the proper format.

If you've followed the directions, your command prompt should have the output:

```
This is a string
Strings can store letters and numbers
```

Next, you will want some notes on variable names:

```lua
thisIsCamelCase = true
this_is_snake_case = true

print( thisIsCamelCase )
print( this_is_snake_case )

1invalidName = true
also bad = true
don't-bother = true
```

When you run the file you should see an error that says something like:

```
lua: 01 Variables and Comments.lua:13: unexpected symbol near '1'`
```

Let's break down this error:

- `lua:`: This tells you that the error is a Lua error.

- `01 Variables and Comments.lua`: This is the file in which the error occurs.

- `13:` This tells you the line on which the error occurred. If the line isn't
  exactly 13, don't worry. (In fact, it should probably be past 13 because of
  all the comments you've added!)

- `unexpected symbol near '1'`: This tells you that there is something that was
  not expected near `1`. If you remember from earlier, variable names in Lua
  cannot start with numbers. To get rid of this error, change that line to
  something like this:

```lua
-- 1invalidName = false
-- Variable names can't start with numbers!
```

When you run the file again, you should get another error:

```
lua: test.lua:14: syntax error near 'bad'
```

This time, the syntax error is near `bad`. This is because variables in Lua
cannot have spaces! The Lua interpreter is expecting something after the space,
such as a comma or equal-sign. To get rid of this, comment out the line and
add some notes.

When you run the file again, you should get yet another error:

```
lua: test.lua:15: unfinished string near ''t-bother = true'
```

This is because the `'` indicates the start of a string. In Lua, strings can't
be multiple lines. (Actually, they can, but you need to use special characters
to indicate this). At any rate, the string isn't enclosed, so the error is
still valid. Get rid of the quote to get rid of that error message, and add a
comment noting so. Now, you're greeted with a new error:

```
lua: test.lua:15: syntax error near '-'
```

This is because you can't have dashes within a variable name. Comment out the
line to get rid of the error.

Now add the following:

```lua
booleanVariable = true
stringVariable = 'string'
numberVariable = 123
multiLineString = [[
This is a
string that spans
mutliple lines
]]

--[[
This comment also
spans mutliple lines
]]

print( booleanVariable )
print( stringVariable )
print( numberVariable )
print( multiLineString )
print( thisVariableIsNil )
```

**Remember**: This is supposed to serve as *your* notes. Add more if you think
it's necessary. (You should have **much** more than I have here).





## Basic Loops

Sometimes when you are programming, there will be a task that is repeated many
times. For instance, say you want to print your name five times.  You could
write something that looks like this:

```lua
name = 'John Smith'

print( name )
print( name )
print( name )
print( name )
print( name )
```

As a programmer, you should strive to be as lazy when typing as possible. This
means that the above code is a big no-no. The main reason for this is that it
is difficult to change. Say, for instance, you want to print your name 10
times. That means copying and pasting everything. (***Hopefully*** you didn't
consider typing all of that!) This is unwieldy, but manageable. But what
happens if you want to print your name ***100*** times? This would be a real
pain to type and would be ridiculous. Thankfully, Lua includes a construct that
is ideal for this type of situation: the `for-loop`.

### Numeric For-Loops

Instead of writing everything multiple times, you can use what are called
**numeric for-loops**. The name might be scary, but all it does is do something
a certain amount of times.  This is the basic structure of this loop is (you
do **not** need to run this):

```lua
for VAR = START, END, INCREMENT do
	-- Code
end
```

In the above code, `VAR` is a variable that represents the current index of the
loop. `START` represents the number at which the loop begins, `END` represents
the number at which the loop stops, and `INCREMENT` is the amount by which to
increase (or decrease) `VAR` at the end of each loop. If `INCREMENT` is not
given, it defaults to `1`.

Below is a basic example of a for-loop:

```lua
for index = 1, 5, 1 do
	print( index )
end

--[[
1
2
3
4
5
]]
```

Note that, because the increment is `1` by default, this loop is the same as

```lua
for index = 1, 5 do
	print( index )
end
```

So, in the above example, if you wanted to print your name a certain amount of
times, you would do something like this:

```lua
name = 'John Smith'
times = 100

for index = 1, times do
	print( name )
end
```

This is **much** better than typing that and changing it all the time.

With most cases, you will want to increment by one, but you can increment by
any real number. For instance, if you wanted even numbers, you could do:

```lua
for i = 2, 10, 2 do
	print( i )
end

--[[
2
4
6
8
10
]]
```

#### Using the Stop and Increment Controllers

You may remember the parts of the for-loop labeled `STOP` and `INCREMENT` from
before. These two variables work in conjunction with each-other to control how
much the for-loop loops. The loop will continue until the index will surpass
`STOP`. Here are some examples of how different loops work:

```lua
for i = 1, 8, 2 do
	print( i )
end
--[[
1
3
5
7
]]

for i = 8, 1, -2 do
	print( i )
end
--[[
8
6
4
2
]]
```

Note that in each of the above examples, if the loop would have executed one
more time, the index would have surpassed `STOP`.

### While-Loops

While loops rely on [booleans](#booleans) to control their flow. A while-loop
executes **while** the condition is true. For instance, if you wanted to
implement a simple incrementing for-loop, you would do something like this:

```lua
index = 1
while index < 5 do
	print( index )
	index = index + 1
end

--[[
1
2
3
4
]]
```

A look at how the loop works helps to understand why it prints 1-4 and not 5.
This is what the loop looks like at each step of execution (do **not** run the
following code; it is simply an illustration of what is occurring):

```
Is 1 < 5? Yes, so:
	print( 1 )
	index = 1 + 1 -- (index now is equal to 2)
	Check condition again

Is 2 < 5? Yes, so:
	print( 2 )
	index = 2 + 1 -- (index = 3)
	Check condition again

Is 3 < 5? Yes, so:
	print( 3 )
	index = 3 + 1
	Check condition again

Is 4 < 5? Yes, so:
	print( 4 )
	index = 4 + 1
	Check condition again

Is 5 < 5? No, so stop.
```

Now it is obvious why 5 is not output: The loop only executes while the given
condition is `true`, then quits.

Note that it is **essential** to assign the variable *before* the while-loop.
The concept is a bit complicated, but essentially, you can't compare `index`
and `5` if `index` has no value yet. Consider the following example:

```lua
index = nil
while index < 10 do
	print( index )
	index = index + 1
end
```

Because you have not assigned `index` yet, you will get the error "Attempt to
compare a number with [nil](#nil)." This is because you're essentially asking
the interpreter to compare `nil` with `5`. Because `nil` has no value, you
cannot compare it with a number, hence causing the error above.

As long as the statement between the `while` and `do` is `true`, the loop will
continue to repeat. The general structure of a while-loop is:

```lua
while ( BOOLEAN ) do
	-- Code
end
```

`BOOLEAN` is a value that is updated every loop. If `BOOLEAN` is **not**
updated every loop, you will end up with an **infinite loop**.

#### Infinite Loops

An infinite loop will execute until you terminate the execution. You can
interrupt the execution of the process by pressing `Ctrl` and `c` at the same
time. This tells the Lua interpreter to quit what it was doing and is called
**breaking** the execution. For instance, type the following into the
interpreter:

```lua
while true do
	print( 'infinite' )
end
```

Notice that this will continue executing until you break it using `Ctrl+c`.

#### Break

There is actually a command that can also be used to abort the execution of a
loop called `break`. This is used if you want to stop the execution of a loop
for any reason. Take the following example:

```lua
index = 1

while index < 5 do
	print( index )
	index = index + 1
	break
end

print( index ) -- 2
```

The `break` command ended the loop before the execution completed. This may not
seem useful now, but it will become more useful later when you have learned
about more advanced structures, such as `if-then` statements.

## If-Then Statements

### Boolean Operators

#### And

#### Or

#### Short-Circuiting
