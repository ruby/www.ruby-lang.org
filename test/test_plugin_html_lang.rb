# frozen_string_literal: true

require "helper"
require "liquid"
require_relative "../_plugins/html_lang"

describe Jekyll::HtmlLangFilter do
  include Jekyll::HtmlLangFilter

  describe "#to_html_lang" do
    it "returns the same string if no underscore is present" do
      _(to_html_lang("en")).must_equal "en"
      _(to_html_lang("fr")).must_equal "fr"
    end

    it "converts Jekyll locale with underscore to BCP 47 format" do
      _(to_html_lang("zh_cn")).must_equal "zh-CN"
      _(to_html_lang("zh_tw")).must_equal "zh-TW"
      _(to_html_lang("pt_br")).must_equal "pt-BR"
    end

    it "returns the input as is if it is not a string" do
      _(to_html_lang(nil)).must_be_nil
      _(to_html_lang(123)).must_equal 123
    end
  end

  describe "integration with Liquid" do
    it "is registered as a liquid filter" do
      template = Liquid::Template.parse("{{ 'zh_cn' | to_html_lang }}")
      _(template.render).must_equal "zh-CN"
    end

    it "works correctly in a liquid template for simple lang" do
      template = Liquid::Template.parse("{{ 'en' | to_html_lang }}")
      _(template.render).must_equal "en"
    end
  end
end
