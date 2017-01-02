#!/bin/sh

notmuch new 2>&1 >/dev/null | grep -v "^Note:\\|ln:" 1>&2
exec notmuch-mutt -o ~/Maildir/.temporary.Search -p search
