#!/usr/bin/perl

print "
after to make my changes, i should run: 
\$ git diff > tmp; ./scripts/checkpatch.pl tmp 
 

I need make a commit message, and I need a prefix, that I can run the follow command to see the lasts commits for this file and see the prefix:
I can run:
\$ git log --oneline --no-merges -10 example/file.c
 

make commit message. The commit must have -s parameter to asign the end commit. 
 

after I should run:
\$ perl scripts/get_maintainer.pl --separator , --nokeywords --nogit --
nogit-fallback --norolestats -f <caminho_do_arquivo.c>
 

Then I get the result of previous command for send email
\$ git format-patch -o /tmp/ -1 <commit ID> --to=example\@example.com --cc=example\@example.com


for the previous command, I can set the prefix in subject email with the follow command:
\$ git format-patch --subject-prefix\"PATCH v1\"
The prefix should have the version of PATCH. The v1 don't need the version number, but in v2, v3 ... Is required.
 

then run:
\$ git send-email
";
