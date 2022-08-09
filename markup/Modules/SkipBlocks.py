# -*- coding: utf-8 -*-
# Copyright 2022 Hai Liang W.
# Licensed under the MIT license

from __future__ import absolute_import
from __future__ import print_function
from __future__ import unicode_literals

from markup.Module import Module
from markup.Transform import Transform


class SkipLine(Module):
    """
    Module for skip lines
    """

    priority = 0

    # skip file flag
    markup_markdown_end = "<!-- markup:markdown-end -->"
    markup_markdown_begin = "<!-- markup:markdown-begin -->"

    def transform(self, data):
        transforms = []
        linenum = 0

        for line in data:
            striped = line.strip()

            if stripped == self.markup_markdown_begin:
                # Drop all previous transformed lines
                for x in transforms:
                    x.oper = "drop"
                transform = Transform(linenum, "drop")
                transforms.append(transform)
            elif stripped == self.markup_markdown_end:
                for dropped in range(linenum, len(data)):
                    transform = Transform(linenum=dropped, oper="drop")
                    transforms.append(transform)
                return transforms
            else:
                transform = Transform(linenum, "noop")
                transforms.append(transform)
            linenum = linenum + 1

        return transforms
