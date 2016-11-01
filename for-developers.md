

0. [Doxygen](doxygen)
1. [Language Standards](#language-standards)
2.  [Naming Conventions](#NamingConventions)
    1.  [General notes](#Generalnotes)
    2.  [Class Names](#ClassNames)
    3.  [File Names](#FileNames)
    4.  [Class Library Names](#ClassLibraryNames)
    5.  [Method Names](#MethodNames)
    6.  [C Function Names](#CFunctionNames)
    7.  [Class Member Variable Names](#ClassMemberVariableNames)
    8.  [Method Argument and local Variable
        Names](#MethodArgumentandlocalVariableNames)
    9.  [Pointer and Reference Variables
        Names](#PointerandReferenceVariablesNames)
    10. [Global and Static Variables](#GlobalandStaticVariables)
    11. [Global Constants, Enums and Macro
        Names](#GlobalConstantsEnumsandMacroNames)
    12. [Type Names](#TypeNames)
    13. [ C++ File Extensions](#CFileExtensions)

3.  [3. Documentation](#Documentation)
    1.  [3.1. File Header for include files (.h
        only)](#FileHeaderforincludefiles.honly)
    2.  [3.2. File Header for source files (.cpp and .c
        only)](#FileHeaderforsourcefiles.cppand.conly)
    3.  [3.3. API Documentation](#APIDocumentation)
    4.  [3.4. Code Documentation](#CodeDocumentation)
    5.  [3.5. Doxygen](#Doxygen)

4.  [4. Methods and Functions](#MethodsandFunctions)
    1.  [4.1. Complexity](#Complexity)
    2.  [4.2. Centralized exiting and early
        returns](#Centralizedexitingandearlyreturns)

5.  [5. Formatting](#Formatting)
    1.  [5.1. Indentation](#Indentation)
    2.  [5.2. Breaking long lines and
        strings](#Breakinglonglinesandstrings)
    3.  [5.3. Placing Spaces](#PlacingSpaces)
    4.  [5.4. Pointer and Reference
        Variables](#PointerandReferenceVariables)
    5.  [5.5. Placing Braces](#PlacingBraces)
    6.  [5.6. C++ Templates](#CTemplates)

6.  [6. Memory Allocation](#MemoryAllocation)
7.  [7. Error Handling](#ErrorHandling)
8.  [8. References](#References)


# Astyle 
[Artistic Style](http://astyle.sourceforge.net) is a source code indenter, formatter, and beautifier for the C, C++, C# and Java programming languages.
# Uncrustify 
[Uncrustify](http://uncrustify.sourceforge.net/) a highly configurable, easily modifiable source code beautifier.
# UniversalIndentGUI 
[UniversalIndentGUI](http://universalindent.sourceforge.net/) offers a live preview for setting the parameters of nearly any indenter. You change the value of a parameter and directly see how your reformatted code will look like. Save your beauty looking code or create an anywhere usable batch/shell script to reformat whole directories or just one file even out of the editor of your choice that supports external tool calls"

# Language Standards 
-   C99
-   C++11 (minimum versions gcc 4.6 ~~and Intel 12~~)

* * * * *

2. Naming Conventions
---------------------

### 2.1. General notes 

-   Use descriptive names.
-   Use compound name.
-   Compound names shouldn't be to long (up to three words).
-   Use short names where it makes sense, for example counters (`i`,
    `j`, `k` etc).

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

Example
:   `bool doHdf5Save_m;`

* * * * *

### 2.8. Method Argument and local Variable Names {#MethodArgumentandlocalVariableNames}

-   Use descriptive names.
-   camelCase

* * * * *

### 2.9. Pointer and Reference Variables Names {#PointerandReferenceVariablesNames}

-   You may append `_r` to reference variable names.
-   Same for pointer variable names with `_p`.

* * * * *

### 2.10. Global and Static Variables {#GlobalandStaticVariables}

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

Example
:   #if defined(USE_LARGE_INDICES)
        typedef int64_t                 h5_loc_idx_t;   // type for a local index
        typedef int64_t                 h5_loc_id_t;    // type for a local ID
        #else
        typedef int32_t                 h5_loc_idx_t;   // type for a local index
        typedef int32_t                 h5_loc_id_t;    // type for a local ID
        #endif

* * * * *

\#\#\# Name Spaces

### 2.13. C++ File Extensions 

-   header files: `.h`
-   source files: `.cpp`

* * * * *

3. Documentation {#Documentation}
----------------

### 3.1. File Header for include files (.h only) 

-   Link to copyright and license
-   Short description what is implemented in here (in Doxygen notation)

Example
:   ``` {.wiki}
    //
    //  Copyright & License: See Copyright.readme in src directory
    //

    /*!
      Class documentation
     */
    ```

### 3.2. File Header for source files (.cpp and .c only) {

-   Link to copyright and license

Example
:   ``` {.wiki}
    //
    //  Copyright & License: See Copyright.readme in src directory
    //
    ```

* * * * *

### 3.3. API Documentation

-   All public methods and functions must be documented using Doxygen

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

``` {.wiki}
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

``` {.wiki}
// $Id$
/**
 * @file sourceFile.cpp
 * Write description of source file here for Doxygen.
 *
 * @brief Can use "brief" tag to explicitly generate comments for file documentation.
 *
 * @author Me        [Note: depricated practice as CM systems like Subversion git?? will maintain author info and blame logs.]
 * @version 1.69    [Note: depricated practice as CM systems like Subversion git?? will maintain file history and revision numbers.]
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

4. Methods and Functions
------------------------

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

Rational
:   -   unconditional statements are easier to understand and follow
    -   nesting is reduced
    -   errors by not updating individual exit points when making
        modifications are prevented

Example
:   (from Linux coding style)

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

* * * * *

5. Formatting 
-------------

### 5.1. Indentation {#Indentation}

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
-   If a line is longer than 80 characters, think about breaking it into

reasonable chunks.

-   applies also strings
-   Without defining a hard limit, line with more than 160 characters

are definitely far to long.

-   Comments should fit within 80 characters per line

* * * * *

### 5.3. Placing Spaces 

-   use a space before an opening paranthese `(` and opening curly
    bracket `{`.
-   do not use a space before an opening square bracket.
-   use spaces around binary operators
-   but no space after unary operators
-   no space after prefix increment- and decrement operator
-   no space before postfix increment- and decrement operator
-   no space around `.` and `->`

Examples
:   -   `if (i == 42) return i;`
    -   `i = j + 2;`
    -   `i += 42;`
    -   `i++;`
    -   `mesh->fname = argv[1];`

* * * * *

### 5.4. Pointer and Reference Variables

-   If you define a pointer or reference type, place `*` resp. `&` close
    to the type not the variable name.

Example
:   `h5t_mesh_t* const mesh;`

* * * * *

### 5.5. Placing Braces {#PlacingBraces}

**classes**

``` {.wiki}
class Distribution: public Definition {

public:
    Distribution();
    ...

private:
    ...
};
```

**methods and functions**

``` {.wiki}
int method (int x) {
    ...
}
```

**`if`-statement**

``` {.wiki}
if (i == 42) {
    ...
} else {
    ...
}
```

Do not unnecessarily use braces where a single statement will do:

``` {.wiki}
if (i == 42)
    return SUCCESS;
```

**`for`-loop**

``` {.wiki}
for (i = 0; i < 42; i++) {
    ...
}
```

**`do-while`-loop**

``` {.wiki}
do {
    ...
} while (i < 42);
```

**`switch`-statement**

``` {.wiki}
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

Example
:   switch (entity_type) {
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

* * * * *

### 5.6. C++ Templates {#CTemplates}

-   Naming conventions for template classes/functions are the same as
    for the non template ones.
-   In nested template instantiations put spaces between consecutive `>`
-   Break long template parameter lists into multiple lines and use
    identation

Examples
:   std::tuple<
            std::vector<int>,
            double,
            std::map<std::string, std::vector<char> >
        > my_really_complicated_variable;

* * * * *

6. Memory Allocation
--------------------

-   Use std::vector for dynamic arrays
-   Use std::unique\_ptr/std::shared\_ptr where ever possible.

* * * * *

7. Error Handling 
-----------------

-   Always check error conditions and handle them!
-   If we can proceed, it may be enough to print a warning.
-   Otherwise print an error message and return with an error code. Do
    ***not*** proceed!
-   Use asserts to handle pre/pst condition errors
-   Use exceptions to handle runtime conditions/erros

:TODO: be more elaborated.

* * * * *

8. References <a name="#References"></a>
-------------

[ http://www.possibility.com/Cpp/CppCodingStandard.html](http://www.possibility.com/Cpp/CppCodingStandard.html)

[ http://www.kernel.org/doc/Documentation/CodingStyle](http://www.kernel.org/doc/Documentation/CodingStyle)

[ http://www.yolinux.com/TUTORIALS/LinuxTutorialC++CodingStyle.html\#DOXYGEN](http://www.yolinux.com/TUTORIALS/LinuxTutorialC++CodingStyle.html#DOXYGEN)

### Download in other formats:

-   [Plain Text](/OPAL/wiki/CodingStyle?format=txt)

* * * * *

[![Trac
Powered](/OPAL/chrome/common/trac_logo_mini.png)](http://trac.edgewall.org/)

Powered by [**Trac 0.12.1**](/OPAL/about)\
 By [Edgewall Software](http://www.edgewall.org/).

Visit the Trac open source project at\
<http://trac.edgewall.org/>