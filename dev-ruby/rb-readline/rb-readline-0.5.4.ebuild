# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
inherit ruby-fakegem

DESCRIPTION="Ruby implementation of the GNU readline C library"
HOMEPAGE="http://rubygems.org/gems/rb-readline"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_bdepend "dev-ruby/rake
		>=dev-ruby/minitest-5.2"

all_ruby_prepare() {
	sed -i -e '/bundler/ s:^:#:' Rakefile || die

	# Skip a test that fails when run in the ebuild environment.
	sed -i -e '/test_readline_with_default_parameters_does_not_error/,/end/ s:^:#:' test/test_readline.rb || die
}