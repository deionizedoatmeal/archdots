#!/bin/bash

RSLT1=$(i3-msg -t get_workspaces | grep -o "\"name\":\"1"); RSLT2=$(i3-msg -t get_workspaces | grep -o "\"name\":\"1\",\"visible\":true"); if [ -z $RSLT1 ]; then echo "1"; else if [ -z $RSLT2 ]; then echo "  "; else echo "   "; fi; fi

RSLT1=$(i3-msg -t get_workspaces | grep -o "\"name\":\"2"); RSLT2=$(i3-msg -t get_workspaces | grep -o "\"name\":\"2\",\"visible\":true"); if [ -z $RSLT1 ]; then echo "2"; else if [ -z $RSLT2 ]; then echo "  "; else echo "   "; fi; fi

RSLT1=$(i3-msg -t get_workspaces | grep -o "\"name\":\"3"); RSLT2=$(i3-msg -t get_workspaces | grep -o "\"name\":\"3\",\"visible\":true"); if [ -z $RSLT1 ]; then echo "3"; else if [ -z $RSLT2 ]; then echo "  "; else echo "   "; fi; fi

RSLT1=$(i3-msg -t get_workspaces | grep -o "\"name\":\"4"); RSLT2=$(i3-msg -t get_workspaces | grep -o "\"name\":\"4\",\"visible\":true"); if [ -z $RSLT1 ]; then echo "4"; else if [ -z $RSLT2 ]; then echo "  "; else echo "   "; fi; fi

RSLT1=$(i3-msg -t get_workspaces | grep -o "\"name\":\"5"); RSLT2=$(i3-msg -t get_workspaces | grep -o "\"name\":\"5\",\"visible\":true"); if [ -z $RSLT1 ]; then echo "5"; else if [ -z $RSLT2 ]; then echo "  "; else echo "   "; fi; fi

RSLT1=$(i3-msg -t get_workspaces | grep -o "\"name\":\"6"); RSLT2=$(i3-msg -t get_workspaces | grep -o "\"name\":\"6\",\"visible\":true"); if [ -z $RSLT1 ]; then echo "6"; else if [ -z $RSLT2 ]; then echo "  "; else echo "   "; fi; fi

RSLT1=$(i3-msg -t get_workspaces | grep -o "\"name\":\"7"); RSLT2=$(i3-msg -t get_workspaces | grep -o "\"name\":\"7\",\"visible\":true"); if [ -z $RSLT1 ]; then echo "7"; else if [ -z $RSLT2 ]; then echo "  "; else echo "   "; fi; fi

RSLT1=$(i3-msg -t get_workspaces | grep -o "\"name\":\"8"); RSLT2=$(i3-msg -t get_workspaces | grep -o "\"name\":\"8\",\"visible\":true"); if [ -z $RSLT1 ]; then echo "8"; else if [ -z $RSLT2 ]; then echo "  "; else echo "   "; fi; fi

RSLT1=$(i3-msg -t get_workspaces | grep -o "\"name\":\"9"); RSLT2=$(i3-msg -t get_workspaces | grep -o "\"name\":\"9\",\"visible\":true"); if [ -z $RSLT1 ]; then echo "9"; else if [ -z $RSLT2 ]; then echo "  "; else echo "   "; fi; fi

RSLT1=$(i3-msg -t get_workspaces | grep -o "\"name\":\"10"); RSLT2=$(i3-msg -t get_workspaces | grep -o "\"name\":\"10\",\"visible\":true"); if [ -z $RSLT1 ]; then echo "10"; else if [ -z $RSLT2 ]; then echo "  "; else echo "   "; fi; fi
