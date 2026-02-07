---
layout: news_post
title: "\"Ruby Hacking Guide\" is out though ..."
author: "NaHi"
lang: vi
---

[![RHG](http://direct.ips.co.jp/directsys/Images/Goods/1/1721B.gif){:
.icon width="70" height="88"}][cover] A book named “Ruby source code Kanzen
Kaisetsu – Ruby Hacking Guide” by Aoki-san is out though it’s written in
Japanese…

It’s a must-buy item for Ruby hacker, who can read Japanese. :(

* Publisher: Impress
* Author: AOKI, Minero under the editorship of MATSUMOTO, Yukihiro
* ISBN: 4-8443-1721-0

[cover]: http://direct.ips.co.jp/book/Template/Goods/go_BookstempGR.cfm?GM_ID=1721&amp;SPM_ID=1&amp;CM_ID=004000G20&amp;PM_No=&amp;PM_Class=&amp;HN_NO=00420

I tried to translate the table of contents.
Bear in mind that it’s an unofficial translation.

    Preface
    i      Target reader
    ii     Construction of this book
    iii    Environment
    ix     Web site
    x      Thanks
    0      Preface
    0.1    The characteristics of Ruby
    0.2    How to hack source code
    0.2.1  Principle
    0.2.2  Analytic technique
    0.2.3  Dynamic analysis
    0.2.4  Static analysis
    0.2.5  History knows everything
    0.2.6  Tool for static analysis
    0.3    Build
    0.3.1  Version
    0.3.2  Getting the source code
    0.3.3  Compile
    0.4    Build details
    0.4.1  configure
    0.4.2  autoconf
    0.4.3  make
    0.5    CVS
    0.5.1  Teach yourself CVS in 50 lines
    0.6    The construction of ruby source code
    0.6.1  Physical structure
    0.6.2  Dividing the source code
    0.6.3  Logical structure
    Chapter I: Object
    1.     Ruby language minimum
    1.1    Object
    1.1.1  String
    1.1.2  Various literals
    1.1.3  Method call
    1.2    Program
    1.2.1  Top-level
    1.2.2  Local variable
    1.2.3  Constant variable
    1.2.4  Control structure
    1.3    Class and method
    1.3.1  Class
    1.3.2  Class definition
    1.3.3  Method definition
    1.3.4  self
    1.3.5  Instance variable
    1.3.6  Initialize
    1.3.7  Inheritance
    1.3.8  Variable inheritance ... ?
    1.3.9  Module
    1.4    Program II
    1.4.1  Nested constant
    1.4.2  Everything is evaluated
    1.4.3  Scope of local variable
    1.4.4  self as a context
    1.4.5  Loading
    1.5    About the class, more
    1.5.1  About constant continues
    1.5.2  Meta-class
    1.5.3  Meta-object
    1.5.4  Singleton method
    1.5.5  Class variable
    1.6    Global variable
    2.     Object
    2.1    The structure of the Ruby object
    2.1.1  Guidelines
    2.1.2  VALUE and object structure
    2.1.3  Embedded objects in VALUE
    2.2    Method
    2.2.1  struct RClass
    2.2.2  Method search
    2.3    Instance variable
    2.3.1  rb_ivar_set()
    2.3.2  generic_ivar_set()
    2.3.3  Gap in the structure
    2.3.4  rb_ivar_get()
    2.4    Object structure
    2.4.1  struct RString
    2.4.2  struct RArray
    2.4.3  struct RRegexp
    2.4.4  struct RHash
    2.4.5  struct RFile
    2.4.6  struct RData
    3.     Name and name table
    3.1    st_table
    3.1.1  Outline
    3.1.2  Data structure
    3.1.3  Example of st_hash_type
    3.1.4  st_lookup()
    3.1.5  st_add_direct()
    3.1.6  st_insert()
    3.2    ID and symbol
    3.2.1  From char* to ID
    3.2.2  From ID to char*
    3.2.3  Conversion between VALUE and ID
    4.     Class and module
    4.1    Definition of class and method
    4.1.1  Definition of class
    4.1.2  Definition of nested class
    4.1.3  Definition of module
    4.1.4  Definition of method
    4.1.5  Definition of singleton method
    4.1.6  Entry point
    4.2    Singleton class
    4.2.1  rb_define_singleton_method()
    4.2.2  rb_singleton_class()
    4.2.3  Usual class and singleton class
    4.2.4  Compression of rb_singleton_class()
    4.2.5  Compression of rb_make_metaclass()
    4.2.6  What is the singleton class
    4.2.7  Singleton class and instance
    4.2.8  Summary
    4.3    Meta-class
    4.3.1  Inheritance of singleton method
    4.3.2  Singleton class of a class
    4.3.3  The class of the class of the class
    4.3.4  Singleton class and meta-class
    4.3.5  Bootstrap
    4.4    Class name
    4.4.1  Name to class
    4.4.2  Class to name
    4.4.3  Nest level 2 or more
    4.4.4  Anonymous class
    4.5    Include
    4.5.1  rb_include_module (1)
    4.5.2  include_class_new()
    4.5.3  Simulation
    4.5.4  rb_include_module (2)
    5.     Garbage Collection
    5.1    Memory image at runtime
    5.1.1  Segment
    5.1.2  alloca()
    5.2    Outline
    5.2.1  What's GC
    5.2.2  What's done in GC
    5.2.3  Mark & sweep
    5.2.4  Stop & copy
    5.2.5  Reference count
    5.3    Object management
    5.3.1  struct RVALUE
    5.3.2  Object heap
    5.3.3  freelist
    5.3.4  add_heap()
    5.3.5  rb_newobj()
    5.4    Mark
    5.4.1  rb_gc_mark()
    5.4.2  rb_gc_mark_children()
    5.4.3  rb_gc()
    5.4.4  Ruby stack
    5.4.5  Register
    5.4.6  Machine stack
    5.4.7  Other root objects
    5.5    Sweep
    5.5.1  Special treatment for NODE
    5.5.2  Finalizer
    5.5.3  rb_gc_force_recycle()
    5.6    Consideration
    5.6.1  Freeing the memory space
    5.6.2  Generational GC
    5.6.3  Compaction
    5.6.4  volatile, countermeasure for GC
    5.7    The timing of the start
    5.7.1  gc.c inside
    5.7.2  In the interpreter
    5.8    Object allocation
    5.8.1  Allocation framework
    5.8.2  Allocation of user defined object
    5.8.3  The problem of the allocation framework
    6.     Variable and constant
    6.1    Outline of this section
    6.1.1  Variable of Ruby
    6.1.2  Ruby API for the variable
    6.1.3  The point of this section
    6.2    Class variable
    6.2.1  Reference
    6.3    Constant
    6.3.1  Assignment
    6.3.2  Reference
    6.4    Global variable
    6.4.1  General remarks
    6.4.2  Data structure
    6.4.3  Reference
    7.     Security
    7.1    Principle
    7.2    Implementation
    Chapter II: Syntactic analysis
    8.     Ruby language detailed
    8.1    Literal
    8.1.1  String
    8.1.2  Character
    8.1.3  Regular expression
    8.1.4  Array
    8.1.5  Hash
    8.1.6  Range
    8.1.7  Symbol
    8.1.8  Numerical value
    8.2    Method
    8.2.1  Definition and call
    8.2.2  Value of the method
    8.2.3  Omissible argument
    8.2.4  Omission of parenthesis for argument
    8.2.5  Argument and array
    8.2.6  Various call forms
    8.2.7  super
    8.3    Iterator
    8.3.1  Comparison with the higher order function
    8.3.2  Block local variable
    8.3.3  Iterator syntax
    8.3.4  yield
    8.3.5  Proc
    8.4    Expression
    8.4.1  if
    8.4.2  unless
    8.4.3  and && or ||
    8.4.4  Condition arithmetic operator
    8.4.5  while until
    8.4.6  case
    8.4.7  Exception
    8.4.8  Variable and constant
    8.4.9  Assignment
    8.4.10 Self-assignment
    8.4.11 defined?
    8.5    Sentence
    8.5.1  Terminal of the sentence
    8.5.2  if/unless modifier
    8.5.3  while/until modifier
    8.5.4  Class definition
    8.5.5  Method definition
    8.5.6  Singleton method definition
    8.5.7  Singleton class definition
    8.5.8  Multiple assignment
    8.5.9  alias
    8.5.10 undef
    8.6    Others
    8.6.1  Comment
    8.6.2  Embedded document
    8.6.3  Multibyte character
    9.     yacc in a day
    9.1    Outline
    9.1.1  Parser and scanner
    9.1.2  Symbol sequence
    9.1.3  Parser generator
    9.2    Grammar
    9.2.1  Grammar file
    9.2.2  What yacc does
    9.2.3  BNF
    9.2.4  Terminal and non-terminal symbol
    9.2.5  Test method
    9.2.6  Empty rule
    9.2.7  Recursive definition
    9.3    Building of the value
    9.3.1  Shift and reduce
    9.3.2  Action
    9.3.3  The value of symbol
    9.3.4  yacc and type
    9.3.5  Connecting the parser and the scanner
    9.3.6  Embedded action
    9.4    Realistic topic
    9.4.1  Collision
    9.4.2  Lookahead
    9.4.3  Operator priority order
    10.    Parser
    10.1   Guidelines
    10.1.1 Building of a parser
    10.1.2 Dividing parse.y
    10.2   Grammar rule general remarks
    10.2.1 Coding rule
    10.2.2 Important symbol
    10.2.3 Whole structure
    10.2.4 program
    10.2.5 stmt
    10.2.6 expr
    10.2.7 arg
    10.2.8 primary
    10.2.9 Collision of list
    10.3   Scanner
    10.3.1 Parser rough sketch
    10.3.2 Input buffer
    10.3.3 Token buffer
    10.3.4 yylex()
    10.3.5 String kind
    11.    State scanner
    11.1   Outline
    11.1.1 Concrete example
    11.1.2 lex_state
    11.1.3 Reading state scanner
    11.1.4 About the each state
    11.2   Controlling line feed
    11.2.1 Problem
    11.2.2 Implementation
    11.3   Method name which is in reserved word
    11.3.1 Problem
    11.3.2 Method definition
    11.3.3 Method call
    11.3.4 Symbol
    11.4   Modifier
    11.4.1 Problem
    11.4.2 Implementation
    11.5   The collision of do
    11.5.1 Problem
    11.5.2 The solution at the rule level
    11.5.3 The solution at the symbol level
    11.5.4 COND_P()
    11.6   tLPAREN_ARG (1)
    11.6.1 Problem
    11.6.2 Investigation
    11.6.3 In case of 1 argument
    11.6.4 Case 2 or more arguments
    11.7   tLPAREN_ARG (2)
    11.7.1 Problem
    11.7.2 The solution at the rule level
    11.7.3 {} iterator
    11.7.4 do end iterator
    11.7.5 The fact and truth
    12.    Building of syntax tree
    12.1   Node
    12.1.1 NODE
    12.1.2 Node type
    12.1.3 File name and line number
    12.1.4 rb_node_newnode()
    12.2   Building of syntax tree
    12.2.1 YYSTYPE
    12.2.2 Scenery with a syntax tree
    12.2.3 Leaf
    12.2.4 Branch
    12.2.5 Trunk
    12.2.6 Two lists
    12.3   Semantic analysis
    12.3.1 Error in action
    12.3.2 value_expr()
    12.3.3 The global image of the value check
    12.4   Local variable
    12.4.1 Definition of the local variable
    12.4.2 Block local variable
    12.4.3 Data structure
    12.4.4 Scope of local variable
    12.4.5 push and pop
    12.4.6 Adding a variable
    12.4.7 Summary of local variable
    12.4.8 Block local variable
    12.4.9 ruby_dyna_vars in the parser
    Chapter III: Evaluation
    13.    The structure of the evaluator
    13.1   Outline of Chapter III
    13.1.1 What's evaluator
    13.1.2 The characteristics of the ruby evaluator
    13.1.3 eval.c
    13.2   Going from main through ruby_run to rb_eval
    13.2.1 Call graph
    13.2.2 main()
    13.2.3 ruby_init()
    13.2.4 ruby_options()
    13.2.5 ruby_run()
    13.3   rb_eval()
    13.3.1 Outline
    13.3.2 NODE_IF
    13.3.3 NODE_NEWLINE
    13.3.4 Pseudo local variable
    13.3.5 Jump tag
    13.3.6 NODE_WHILE
    13.3.7 Evaluating value of while
    13.4   Exception
    13.4.1 raise
    13.4.2 Global image
    13.4.3 ensure
    13.4.4 rescue
    14.    Context
    14.1   Ruby stack
    14.1.1 Context and stack
    14.1.2 ruby_frame
    14.1.3 ruby_scope
    14.1.4 ruby_block
    14.1.5 ruby_iter
    14.1.6 ruby_dyna_vars
    14.1.7 ruby_class
    14.1.8 ruby_cref
    14.1.9 PUSH/POP macros
    14.1.10 Other condition
    14.2   Module definition
    14.2.1 Investigation
    14.2.2 NODE_MODULE
    14.2.3 module_setup()
    14.2.4 Building local variable scope
    14.2.5 Allocating local variable memory space
    14.2.6 TMP_ALLOC()
    14.2.7 Changing target of method definition
    14.2.8 Nested class
    14.2.9 Replacing frames
    14.3   Method definition
    14.3.1 Investigation
    14.3.2 NODE_DEFN
    14.3.3 copy_node_scope()
    14.3.4 rb_add_method()
    14.4   Assignment and reference
    14.4.1 Local variable
    14.4.2 Constant
    14.4.3 Class variable
    14.4.4 Multiple assignment
    15.    Method
    15.1   Searching method
    15.1.1 Terminology
    15.1.2 Investigation
    15.1.3 SETUP_ARGS()
    15.1.4 rb_call()
    15.1.5 Method cash
    15.2   Invocation
    15.2.1 rb_call0()
    15.2.2 PUSH_FRAME()
    15.2.3 rb_call0() -- NODE_CFUNC
    15.2.4 rb_call0() -- NODE_SCOPE
    15.2.5 Setting argument
    15.2.6 super
    16.    Block
    16.1   Iterator
    16.1.1 Global image
    16.1.2 Push block
    16.1.3 Calling iterator method
    16.1.4 Block invocation
    16.1.5 Target designated jump
    16.1.6 Check of block
    16.2   Proc
    16.2.1 Allocating Proc object
    16.2.2 Copying frames
    16.2.3 Proc invocation
    16.2.4 Block and Proc
    17.    Dynamic evaluation
    17.1   Outline
    17.1.1 eval
    17.1.2 module_eval and instance_eval
    17.2   eval
    17.2.1 eval()
    17.2.2 top_local
    17.2.3 Block local variable
    17.3   instance_eval
    17.3.1 Global image
    17.3.2 After inlining
    17.3.3 Before inlining
    Chapter IV: Fringes of the evaluator
    18.    Loading
    18.1   Outline
    18.1.1 Interface
    18.1.2 Flow of the whole management
    18.1.3 Target of this section
    18.2   Library search
    18.2.1 rb_f_require()
    18.2.2 rb_find_file()
    18.2.3 Load wait
    18.3   Loading Ruby program
    18.3.1 rb_load()
    18.3.2 rb_load_file()
    18.4   Loading extension library
    18.4.1 rb_f_require() -- load_dyna
    18.4.2 Review of linking
    18.4.3 Really dynamic linking
    18.4.4 Dynamic loading API
    18.4.5 dln_load()
    18.4.6 dln_load() -- dlopen()
    18.4.7 dln_load()-- Win32
    19.    Thread
    19.1   Outline
    19.1.1 Ruby interface
    19.1.2 ruby thread
    19.1.3 Is it preemptive?
    19.1.4 Control system
    19.1.5 What is thread switch?
    19.1.6 Method of context switch
    19.1.7 Plan of explanation
    19.2   Trigger
    19.2.1 I/O wait
    19.2.2 Waiting other threads
    19.2.3 Time wait
    19.2.4 Switching due to the time expire
    19.3   Scheduling
    19.3.1 rb_thread_schedule()
    19.3.2 select
    19.3.3 Preparation for select
    19.3.4 Calling select
    19.3.5 Deciding the next thread
    19.3.6 Switching thread
    19.4   Context switch
    19.4.1 Basic line
    19.4.2 rb_thread_save_context()
    19.4.3 rb_thread_restore_context()
    19.4.4 Problem
    Final chapter: The future of Ruby
    20.1   Problems to be solved
    20.1.1 Performance of GC
    20.1.2 Parser implementation
    20.1.3 Reusable parser
    20.1.4 Code hiding
    20.1.5 Interpreter object
    20.1.6 Structure of evaluator
    20.1.7 Speed of the evaluator
    20.1.8 Thread implementation
    20.2   ruby2
    20.2.1 Rite
    20.2.2 Description language
    20.2.3 GC
    20.2.4 Parser
    20.2.5 Evaluator
    20.2.6 Thread
    20.2.7 M17N
    20.2.8 IO
    20.3   Ruby Hacking Guide
    20.3.1 Generational GC
    20.3.2 Oniguruma
    20.3.3 ripper
    20.3.4 Substitutive parser
    20.3.5 JRuby
    20.3.6 NETRuby
    20.3.7 How to participate the development of Ruby
    20.3.8 At the end
    Appendix A: Function and macros reference
    Appendix B: References
    Index
