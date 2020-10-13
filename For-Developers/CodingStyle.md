
1. [Language Standards](#1-language-standards)
2.  [Naming Conventions](#2-naming-conventions)
    1.  [General notes](#21-general-notes)
    2.  [Class Names](#22-class-names)
    3.  [File Names](#23-file-names)
    4.  [Class Library Names](#24-class-library-names)
    5.  [Method Names](#25-method-names)
    6.  [C Function Names](#26-c-function-names)
    7.  [Class Member Variable Names](#27-class-member-variable-names)
    8.  [Method Argument and local Variable
        Names](#28-method-argument-and-local-variable-names)
    9.  [Pointer and Reference Variables
        Names](#29-pointer-and-reference-variables-names)
    10. [Global and Static Variables](#210-global-and-static-variables)
    11. [Global Constants, Enums and Macro
        Names](#211-global-constants-enums-and-macro-names)
    12. [Type Names](#212-type-names)
    13. [C++ File Extensions](#213-c-file-extensions)

3.  [Documentation](#3-documentation)
    1.  [File Header](#31-file-header)
    2.  [Header Files](#32-header-files)
    3.  [API Documentation](#33-api-documentation)
    4.  [Code Documentation](#34-code-documentation)
    5.  [Doxygen](#35-doxygen)

4.  [Methods and Functions](#4-methods-and-functions)
    1.  [Complexity](#41-complexity)
    2.  [Centralized exiting and early
        returns](#42-centralized-exiting-and-early-returns)

5.  [Formatting](#5-formatting)
    1.  [Indentation](#51-indentation)
    2.  [Breaking long lines and
        strings](#52-breaking-long-lines-and-strings)
    3.  [Placing Spaces](#53-placing-spaces)
    4.  [Pointer and Reference
        Variables](#54-pointer-and-reference-variables)
    5.  [Placing Braces](#55-placing-braces)
    6.  [C++ Templates](#56-c-templates)
    7.  [Tools](#57-tools)

6.  [Memory Allocation](#6-memory-allocation)
7.  [Error Handling](#7-error-handling)
8.  [References](#8-references)


# 1. Language Standards

-   C99
-   C++11

* * * * *

# 2. Naming Conventions

### 2.1. General notes 

-   Use descriptive names.
-   Use compound name.
-   Compound names shouldn't be too long (up to three words).
-   Use short names where it makes sense, for example counters (`i`,
    `j`, `k` etc).

* * * * *

### 2.2. Class Names 

-   Name the class after what it is.
-   Use compound names with up to three words.
-   Use nouns.
-   CamelCase: Use upper case letters as word separators, lower case for
    the rest of a word
-   First character in a name is upper case
-   No underscores ('\_')

Examples
:   `class BoundaryGeometry;`

* * * * *

### 2.3. File Names 

-   Use one file per class definition.
-   The file name is the same as the class name.

Example
:   `BoundaryGeometry.cpp`\
    `BoundaryGeometry.h`

* * * * *

### 2.4. Class Library Names 

-   Use name spaces - so you don't have the problem
-   When not using name spaces, it's common to prevent class name
    clashes by prefixing class names with a short unique string.

Examples
:   `class QObject; // the base class of all Qt objects`

* * * * *

### 2.5. Method Names 

-   Use camelCase (first character is lower case).
-   No underscores ('\_')
-   Use a verb as first part in a compound name
    -   `isInGeometry` - to ask a question about something.
    -   `getMaxCoords` - to get a value
    -   `setFoo` - to set a value
    -   ...

Example
:   `getMaxExtend();`

* * * * *

### 2.6. C Function Names

-   All lower case with underscore as separators.

Example
:   `get_max_extend();`

* * * * *

### 2.7. Class Member Variable Names 

-   Use descriptive names.
-   Use camelCase\_m: like method names but append `_m`.
-   No other underscores
-   Physical units must be given, no units are noted by []
-   Doxygen formulas: http://www.doxygen.nl/manual/formulas.html

Example
:   `bool doHdf5Save_m;`
:   `real p_m; /// $\f\beta\gamma\f$

* * * * *

### 2.8. Method Argument and local Variable Names

-   Use descriptive names.
-   camelCase

* * * * *

### 2.9. Pointer and Reference Variables Names

-   You may append `_r` to reference variable names.
-   Same for pointer variable names with `_p`.

* * * * *

### 2.10. Global and Static Variables

-   Use global and static variables only if really required.
-   You should append `_g` to global variable names to make the scope
    clear.
-   Same for static variable names with `_s`.
-   If you have multiple suffixe use `_mp`, `_gp` etc.

* * * * *

### 2.11. Global Constants, Enums and Macro Names 

-   All caps with underscore as separators.
-   Consts and Enums without class scoping should have a reasonable
    prefix to avoid conflicts.

Example
:   `enum {STATE_ERR,  STATE_OPEN, STATE_RUNNING,  STATE_DYING};`

* * * * *

### 2.12. Type Names 

-   Make a typedef for types based on native types.
-   Use the `_t` suffix for typedefs: `typedef UniformMesh Mesh_t`

Example:
```c++
   #if defined(USE_LARGE_INDICES)
        typedef int64_t                 h5_loc_idx_t;   // type for a local index
        typedef int64_t                 h5_loc_id_t;    // type for a local ID
        #else
        typedef int32_t                 h5_loc_idx_t;   // type for a local index
        typedef int32_t                 h5_loc_id_t;    // type for a local ID
        #endif
```

* * * * *

### 2.13. C++ File Extensions 

-   header files: `.h`
-   source files: `.cpp`

* * * * *

# 3. Documentation

### 3.1. File Header

```
//
// Brief description
//
// Copyright (c) YYYY, Notice mentioning University, Institute, Lab or Author
//
// Optional: related work, e.g. title of PhD or Master thesis
//
// This file is part of OPAL.
//
// OPAL is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// You should have received a copy of the GNU General Public License
// along with OPAL.  If not, see <https://www.gnu.org/licenses/>.
//
```

For PSI employees the copyright notice would be:

```
// Copyright (c) YYYY1[, YYYY2...], Paul Scherrer Institut, Villigen PSI, Switzerland
// All rights reserved.
```

For a PhD or Master student, or someone with another affiliation:

```
// Copyright (c) YYYY1[, YYYY2...], Firstname Lastname, University
// All rights reserved
```

Copyright year should be updated, whenever there is a change to the file.
Consecutive years should be aggregated with a dash, individual periods, comma-separated.

This proposal has been discussed in src#482.

* * * * *

### 3.2. Header Files

Add extensive class documentation below header.

```
/*!
 Class documentation
*/
```

* * * * *

### 3.3. API Documentation

-   All public methods and functions must be documented using Doxygen.

### 3.4. Code Documentation

-   Comment what the code does not how.
-   Write comments as you code.
-   use `/* ... */` for multi-line comments
-   use `//` for *short* comments
-   Make gotchas explicit
    -   `:TODO:` to not forget to implement something later
    -   `:BUG:` to document a known bug
    -   `:WARNING:` beware of something.

Quote from the Linux coding style:

``` {.wiki}
Comments are good, but there is also a danger of over-commenting.  NEVER
try to explain HOW your code works in a comment: it's much better to
write the code so that the _working_ is obvious, and it's a waste of
time to explain badly written code.

Generally, you want your comments to tell WHAT your code does, not HOW.
Also, try to avoid putting comments inside a function body: if the
function is so complex that you need to separately comment parts of it,
you should probably go back to chapter 6 for a while.  You can make
small comments to note or warn about something particularly clever (or
ugly), but try to avoid excess.  Instead, put the comments at the head
of the function, telling people what it does, and possibly WHY it does
it.
```

This is over-commenting:

```c++
class Distribution: public Definition {

    //===============
    // Class methods.
    //===============
public:

    /// Exemplar constructor.
    Distribution();
    ...
}
```

* * * * *

### 3.5. Doxygen 

See [Doxygen](doxygen)

``` {.wiki}
// $Id$
/**
 * @file sourceFile.cpp
 * Write description of source file here for Doxygen.
 *
 * @brief Can use "brief" tag to explicitly generate comments for file documentation.
 *
 * @author Me        [Note: deprecated practice as CM systems like git will maintain author info and blame logs.]
 * @version 1.69    [Note: deprecated practice as CM systems like git will maintain file history and revision numbers.]
 */
// $Log$
 
///  Single line comment for Doxygen.
 
/**
   Write description of function here.
   The function should follow these comments.
   Use of "brief" tag is optional. (no point to it)
  
   The function arguments listed with "param" will be compared 
   to the declaration and verified.

   @param[in]     _inArg1 Description of first function argument.
   @param[out]    _outArg2 Description of second function argument.
   @param[in,out] _inoutArg3 Description of third function argument.
   @return Description of returned value.
 */
 
```

Example of detailed code description in Latex

``` {.wiki}
 /** \f[ \vec{u}_{m} = \vec{\beta}_{n} \gamma_{n} = \vec{\beta}_{n-1/2}\; \gamma_{n-1/2} + \frac{q}{m_{e} c} \vec{E} \frac{\Delta t}{2} \f]
   * \code
   * um = P + 0.5 * Q * dt/M * c * E;
   * \endcode
   */
```

# 4. Methods and Functions

### 4.1. Complexity 

-   Do \*one\* thing per method.
-   Break down complex methods.
-   Use helper functions/methods.
-   3-4 levels of indentation are OK - 6+ definitely not.

Quote from the Linux coding style:

``` {.wiki}
Functions should be short and sweet, and do just one thing.  They should
fit on one or two screenfuls of text (the ISO/ANSI screen size is 80x24,
as we all know), and do one thing and do that well.

The maximum length of a function is inversely proportional to the
complexity and indentation level of that function.  So, if you have a
conceptually simple function that is just one long (but simple)
case-statement, where you have to do lots of small things for a lot of
different cases, it's OK to have a longer function.

However, if you have a complex function, and you suspect that a
less-than-gifted first-year high-school student might not even
understand what the function is all about, you should adhere to the
maximum limits all the more closely.  Use helper functions with
descriptive names (you can ask the compiler to in-line them if you think
it's performance-critical, and it will probably do a better job of it
than you would have done).

Another measure of the function is the number of local variables.  They
shouldn't exceed 5-10, or you're doing something wrong.  Re-think the
function, and split it into smaller pieces.  A human brain can
generally easily keep track of about 7 different things, anything more
and it gets confused.  You know you're brilliant, but maybe you'd like
to understand what you did 2 weeks from now.
```

* * * * *

### 4.2. Centralized exiting and early returns 

-   If a function exists from multiple location and some common work has
    to be done (like cleanup), the `goto` statement becomes handy.
-   If there is no common work to be done, return from a function as
    soon as possible.

Rationale:
-   unconditional statements are easier to understand and follow
-   nesting is reduced
-   errors by not updating individual exit points when making
        modifications are prevented

Example:   (from Linux coding style)
```c++
        int fun (int a)
        {
                int result = 0;
                char *buffer = kmalloc(SIZE);

                if (buffer == NULL)
                        return -ENOMEM;

                if (condition1) {
                        while (loop1) {
                                ...
                        }
                        result = 1;
                        goto out;
                }
                ...
        out:
                kfree(buffer);
                return result;
        }
```
* * * * *

# 5. Formatting

### 5.1. Indentation

Quote from Linux Kernel coding style:

``` {.wiki}
Tabs are 8 characters, and thus indentations are also 8 characters.
There are heretic movements that try to make indentations 4 (or even 2!)
characters deep, and that is akin to trying to define the value of PI to
be 3.
```

-   We are heretic and use 4 characters (but 8 character are also
    accepted).
-   Use spaces not tabs.
-   Don't even think about redefining the TAB-character ...

Another quote from the Linux Kernel coding style:

``` {.wiki}
Rationale: The whole idea behind indentation is to clearly define where
a block of control starts and ends.  Especially when you've been looking
at your screen for 20 straight hours, you'll find it a lot easier to see
how the indentation works if you have large indentations.

Now, some people will claim that having 8-character indentations makes
the code move too far to the right, and makes it hard to read on a
80-character terminal screen.  The answer to that is that if you need
more than 3 levels of indentation, you're screwed anyway, and should fix
your program.

In short, 8-char indents make things easier to read, and have the added
benefit of warning you when you're nesting your functions too deep.
Heed that warning.
```

* * * * *

### 5.2. Breaking long lines and strings

-   Avoid long lines.
-   If a line is longer than 80 characters, think about breaking it into reasonable chunks.
-   This applies also to strings.
-   Without defining a hard limit, line with more than 160 characters are definitely far too long.
-   Comments should fit within 80 characters per line

* * * * *

### 5.3. Placing Spaces 

-   use a space before an opening parenthesis `(` and opening curly
    bracket `{`.
-   do not use a space before an opening square bracket.
-   use spaces around binary operators
-   but no space after unary operators
-   no space after prefix increment- and decrement operator
-   no space before postfix increment- and decrement operator
-   no space around `.` and `->`

Examples:
-   `if (i == 42) return i;`
-   `i = j + 2;`
-   `i += 42;`
-   `i++;`
-   `mesh->fname = argv[1];`

* * * * *

### 5.4. Pointer and Reference Variables

-   If you define a pointer or reference type, place `*` resp. `&` close
    to the type not the variable name.

Example:   `h5t_mesh_t* const mesh;`

* * * * *

### 5.5. Placing Braces

**classes**

```c++
class Distribution: public Definition {

public:
    Distribution();
    ...

private:
    ...
};
```

**methods and functions**

```c++
int method (int x) {
    ...
}
```

**`if`-statement**

```c++
if (i == 42) {
    ...
} else {
    ...
}
```

Use braces even for single line blocks, otherwise wrong indentation will confuse you:

```c++
if (i == 42) {
    return SUCCESS;
}
```

**`for`-loop**

```c++
for (i = 0; i < 42; i++) {
    ...
}
```

**`do-while`-loop**

```c++
do {
    ...
} while (i < 42);
```

**`switch`-statement**

```c++
switch (i) {
case: 0 {
    ...
}
case: 42 {
    ...
}
default:
    ...
}
```

It is good practice to keep the cases small.

Example:
```c++
switch (entity_type) {
    case H5T_TYPE_VERTEX:
        return get_adjacencies_to_vertex (m, entity_id, dim, list);
    case H5T_TYPE_EDGE:
        return get_adjacencies_to_edge (m, entity_id, dim, list);
    case H5T_TYPE_TRIANGLE:
        return get_adjacencies_to_triangle (m, entity_id, dim, list);
    case H5T_TYPE_TET:
        return get_adjacencies_to_tet (m, entity_id, dim, list);
    default:
        break;
}
```

* * * * *

### 5.6. C++ Templates

-   Naming conventions for template classes/functions are the same as
    for the non template ones.
-   In nested template instantiations put spaces between consecutive `>`
-   Break long template parameter lists into multiple lines and use
    indentation

Examples :
```c++
std::tuple<
        std::vector<int>,
        double,
        std::map<std::string, std::vector<char> >
> my_really_complicated_variable;
```

* * * * *

### 5.7 Tools

- [Artistic Style](http://astyle.sourceforge.net) is a source code indenter, formatter, and beautifier for the C, C++, C# and Java programming languages.
- [Uncrustify](http://uncrustify.sourceforge.net/) a highly configurable, easily modifiable source code beautifier.
- [UniversalIndentGUI](http://universalindent.sourceforge.net/) offers a live preview for setting the parameters of nearly any indenter. You change the value of a parameter and directly see how your reformatted code will look like. Save your beauty looking code or create an anywhere usable batch/shell script to reformat whole directories or just one file even out of the editor of your choice that supports external tool calls"

* * * * *

# 6. Memory Allocation

-   Use `std::vector` for dynamic arrays
-   Use `std::unique_ptr`/`std::shared_ptr` where ever possible.

* * * * *

# 7. Error Handling

-   Always check error conditions and handle them!
-   If we can proceed, it may be enough to print a warning.
-   Otherwise print an error message and return with an error code. Do
    ***not*** proceed!
-   Use asserts to handle pre/pst condition errors
-   Use exceptions to handle runtime conditions/errors

[comment]: # (TODO: be more elaborated.)

* * * * *

# 8. References

[http://www.possibility.com/Cpp/CppCodingStandard.html](http://www.possibility.com/Cpp/CppCodingStandard.html)

[Linux Kernel Coding Style](http://www.kernel.org/doc/Documentation/CodingStyle)

[http://www.yolinux.com/TUTORIALS/LinuxTutorialC++CodingStyle.html\#DOXYGEN](http://www.yolinux.com/TUTORIALS/LinuxTutorialC++CodingStyle.html#DOXYGEN)

[Google C++ Style Guide](https://google.github.io/styleguide/cppguide.html)
