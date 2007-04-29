#!/usr/bin/env ruby
#
# Simple test of %newobject
#  * The purpose of this test is to confirm that a language module
#  * correctly handles the case when C++ class member functions (of both
#  * the static and non-static persuasion) have been tagged with the
#  * %newobject directive.
#
# Ruby's GC is somewhat broken in that it will mark some more stack space
# leading to the collection of local objects to be delayed.
# Thus, upon invokation, it sometimes you can wait up to several
# instructions to kick in.
# See: http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-core/7449
#
# Author::    gga
# Copyright:: 2007
# License::   SWIG
#

require 'swig_assert'
require 'swig_gc'
require 'newobject1'

include Newobject1


GC.stats(Foo)
100.times { foo1 = Foo.makeFoo; foo2 = foo1.makeMore }
GC.stats(Foo)
swig_assert( 'Foo.fooCount == 200', "but is #{Foo.fooCount}" )
GC.start
GC.stats(Foo)
swig_assert( 'Foo.fooCount <= 2', "but is #{Foo.fooCount}" )
