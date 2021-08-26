[[_TOC_]]

# 0. Short Introduction

In a huger software project it is good practice to define a coding-style. 
This helps other developers to read your code and improves maintainability.

The OPAL coding-style includes rules, recommendations and conventions for
* naming of classes, functions, variables etc
* length/complexity of functions
* code commenting
* code formatting
* ...

For code-formatting Clang-format should be used. The formatting rules are 
defined in the file `.clang-format` in the top-level directory of the OPAL 
repository. For the time being code formatting rules are not enforced, but this will be done somewhen in the future.

The tool `clang-format` is available for most Linux distributions and macOS via Macports. At PSI `clang-format` is available via the Pmodule `clang`.

A good example for a coding-style is the [Linux coding-style](https://www.kernel.org/doc/html/v4.10/process/coding-style.html). It's worth to read. 



# 1. Language Standards

-   C99
-   C++17

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

- header files: `.h`
- source files: `.cpp`
- template classes: `.hpp`

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

-   Generally comment WHAT the code does but not HOW.
-   Write comments as you code.
-   do not over-comment (do not comment the obvious).
-   write the code so that the _working_ is obvious (so no commenting is required).
-   try to use comments at the head of a function only.
-   Avoid longer comments inside functions. If this is required, the 
    function might already be to complex.
-   split large complex functions into multiple self-descriptive functions, 
-   use `/* ... */` for multi-line comments
-   use `//` for *short* comments
-   Make gotchas explicit
    -   `:TODO:` to not forget to implement something later.
    -   `:BUG:` to document a known bug.
    -   `:WARNING:` beware of something.


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
-   The maximum length of a function is inversely proportional to the
complexity.
-   Break down complex methods.
-   Use helper functions/methods.
-   3-4 levels of indentation are OK - 6+ definitely not.

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

-   4 spaces per level.
-   Use spaces not tabs.
-   Don't even think about redefining the TAB-character ...

* * * * *

### 5.2. Breaking long lines and strings

-   The maximum length of a line is 100 characters. This limit applies 
    to code as well as comments.
-   This applies also to strings.
-   Comments should fit within 80 characters per line

* * * * *

### 5.3. Placing Spaces 

-   use a space between a keyword and an opening parenthesis `(`
-   don't use a space between a function and the opening parenthesis
-   use a space before an opening curly bracket `{` but not before a
    C++11 braced list (see example below).
-   do not use a space before an opening square bracket.
-   use spaces around binary operators
-   but no space after unary operators
-   no space after prefix increment- and decrement operator
-   no space before postfix increment- and decrement operator
-   no space around `.` and `->`

Examples:
```
if (i == 42) {
    return i;
}
i = j + 2;
i += 42;
i++;
mesh->fname = argv[1];
int[3] a{1, 2, 3}; // C++ braced list
```

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
    default: {
        ...
    }
}
```

It is good practice to keep the cases small.

Example:
```c++
switch (entity_type) {
    case H5T_TYPE_VERTEX: {
        return get_adjacencies_to_vertex (m, entity_id, dim, list);
    }
    case H5T_TYPE_EDGE: {
        return get_adjacencies_to_edge (m, entity_id, dim, list);
    }
    case H5T_TYPE_TRIANGLE: {
        return get_adjacencies_to_triangle (m, entity_id, dim, list);
    }
    case H5T_TYPE_TET: {
        return get_adjacencies_to_tet (m, entity_id, dim, list);
    }
    default: {
        break;
    }
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
-   Use `std::unique_ptr`/`std::shared_ptr` and `std::make_unique` (once [Increase C++ Standard to c++17](https://gitlab.psi.ch/OPAL/src/-/issues/607) is implemented) / `std::make_shared` where ever possible.
-   Avoid old-style dynamic memory allocation using `new`

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