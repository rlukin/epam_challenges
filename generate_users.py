#! /usr/bin/env python

import crypt
import sys

for name in sys.argv[1:]:
    hashed = crypt.crypt(name, "$6$whoopie$")
    print "# ", name
    print 'user --name=%s --pasword=%s --iscrypted --gecos="%s"' % (name, hashed, name)
