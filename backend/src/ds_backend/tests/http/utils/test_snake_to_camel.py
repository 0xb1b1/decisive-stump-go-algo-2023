#!/usr/bin/env python3

from ds_backend.http.utils.snake_to_camel import to_camel


def test_empty():
    assert to_camel("") == ""


def test_one_word():
    assert to_camel("foo") == "foo"


def test_multiple_words():
    assert to_camel("foo_bar_baz") == "fooBarBaz"
    assert to_camel("foo_foo_foo_fooooo") == "fooFooFooFooooo"


def test_invalid_snake_case():
    assert to_camel("foo__bar") == "fooBar"
    assert to_camel("__foo__baz") == "__fooBaz"
    assert to_camel("foo__foo__") == "fooFoo__"
    assert to_camel("__bar__bar__") == "__barBar__"

    assert to_camel(" ") == ""
    assert to_camel("_") == "_"
    assert to_camel(" _ ") == "_"

    assert to_camel("barBaz") == "barBaz"
