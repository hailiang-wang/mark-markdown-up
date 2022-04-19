<!--The output file does not have the .md extension on purpose.  If it did,
    running markdown-pp over the input file would possibly overwrite it.-->

!TOC


# Test include
!INCLUDE "./test_include.md"


# Test include url
!INCLUDEURL "file:./test_include.md"


# Test youtube embed
!VIDEO "http://www.youtube.com/embed/7aEYoP5-duY"\n"


# Test shift 1
!INCLUDE "./test_shift.m.md", 1


# Test shift 2

!INCLUDE "./test_shift.m.md", 2


# Test reference list
[github]: http://github.com "GitHub"

!REF
