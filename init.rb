# encoding: utf-8

require 'redmine'

Rails.configuration.to_prepare do
  require_dependency 'issue_hooks'
end

Redmine::Plugin.register :redmine_copy_category do
  name 'Redmine Copy Category plugin'
  author 'GOZU Kenichiro'
  description 'チケットのカテゴリを設定されたカスタムフィールドにコピーして横断的に検索可能にします。'
  version '0.0.1'
  url 'https://github.com/gozuk16/redmine_category_copy'
  author_url 'https://github.com/gozuk16'

  requires_redmine :version_or_higher => '2.2.0'

  # プラグイン設定
  settings :default => {
    'copy_category' => 'copy category'
  }, :partial => 'settings/plugin_settings'
end
