# encoding: utf-8

module RedmineCopyCategory
  module Hooks
    class Hooks < Redmine::Hook::ViewListener

      def controller_issues_new_after_save(context={})
        Rails.logger.debug "controller_issues_new_after_save"
        return if context[:params][:issue][:custom_field_values][Setting.plugin_redmine_copy_category['copy_category']].nil?
        category_save(context)
      end

      def controller_issues_edit_after_save(context={})
        Rails.logger.debug "controller_issues_edit_after_save"
        return if context[:params][:issue][:custom_field_values][Setting.plugin_redmine_copy_category['copy_category']].nil?
        category_save(context)
      end

      private
      def category_save(context={})
        issue_id = context[:issue].id
        Rails.logger.debug "category_save issue_id: #{issue_id}"
        custom_value = CustomValue.find(:first,
                                        :conditions => ["customized_type = 'Issue'
                                        and customized_id = ?
                                        and custom_field_id = ?",
                                        issue_id, Setting.plugin_redmine_copy_category['copy_category']])
        # save category
        if custom_value.blank?
          custom_value = CustomValue.new
          custom_value.customized_type = 'Issue'
          custom_value.customized_id = issue_id
          custom_value.custom_field_id = Setting.plugin_redmine_copy_category['copy_category']
          Rails.logger.debug "category_save custom_value: insert"
        end
        if context[:params][:issue][:category_id].blank? then
          category_name = ""
        else
          category_name = IssueCategory.find(context[:params][:issue][:category_id]).name
        end
        Rails.logger.debug "category_save: #{category_name}"
        custom_value.value = category_name
        custom_value.save
      end

    end
  end
end
