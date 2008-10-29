# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 85) do

  create_table "assignments", :force => true do |t|
    t.column "created_at",                        :datetime
    t.column "updated_at",                        :datetime
    t.column "name",                              :string
    t.column "directory_path",                    :string
    t.column "submitter_count",                   :integer,  :limit => 10, :default => 0,     :null => false
    t.column "course_id",                         :integer,                :default => 0,     :null => false
    t.column "instructor_id",                     :integer,                :default => 0,     :null => false
    t.column "private",                           :boolean,                :default => false, :null => false
    t.column "num_reviews",                       :integer,                :default => 0,     :null => false
    t.column "num_review_of_reviews",             :integer,  :limit => 10, :default => 0,     :null => false
    t.column "num_review_of_reviewers",           :integer,                :default => 0,     :null => false
    t.column "review_strategy_id",                :integer,                :default => 0,     :null => false
    t.column "mapping_strategy_id",               :integer,                :default => 0,     :null => false
    t.column "review_questionnaire_id",           :integer
    t.column "review_of_review_questionnaire_id", :integer
    t.column "teammate_review_questionnaire_id",  :integer,  :limit => 10
    t.column "review_weight",                     :float
    t.column "reviews_visible_to_all",            :boolean
    t.column "team_assignment",                   :boolean
    t.column "wiki_type_id",                      :integer,                :default => 0,     :null => false
    t.column "require_signup",                    :boolean
    t.column "num_reviewers",                     :integer,  :limit => 10, :default => 0,     :null => false
    t.column "spec_location",                     :text
    t.column "author_feedback_questionnaire_id",  :integer
    t.column "team_count",                        :integer,                :default => 0,     :null => false
  end

  add_index "assignments", ["review_questionnaire_id"], :name => "fk_assignments_review_questionnaires"
  add_index "assignments", ["review_of_review_questionnaire_id"], :name => "fk_assignments_review_of_review_questionnaires"
  add_index "assignments", ["wiki_type_id"], :name => "fk_assignments_wiki_types"

  create_table "assignments_questionnaires", :force => true do |t|
    t.column "questionnaire_id", :integer, :default => 0, :null => false
    t.column "assignment_id",    :integer, :default => 0, :null => false
  end

  add_index "assignments_questionnaires", ["questionnaire_id"], :name => "fk_assignments_questionnaires_questionnaires"
  add_index "assignments_questionnaires", ["assignment_id"], :name => "fk_assignments_questionnaires_assignments"

  create_table "comments", :force => true do |t|
    t.column "participant_id", :integer, :default => 0,     :null => false
    t.column "private",        :boolean, :default => false, :null => false
    t.column "comment",        :text,    :default => "",    :null => false
  end

  create_table "content_pages", :force => true do |t|
    t.column "title",           :string
    t.column "name",            :string,   :default => "", :null => false
    t.column "markup_style_id", :integer
    t.column "content",         :text
    t.column "permission_id",   :integer,  :default => 0,  :null => false
    t.column "created_at",      :datetime
    t.column "updated_at",      :datetime
    t.column "content_cache",   :text
  end

  add_index "content_pages", ["permission_id"], :name => "fk_content_page_permission_id"
  add_index "content_pages", ["markup_style_id"], :name => "fk_content_page_markup_style_id"

  create_table "controller_actions", :force => true do |t|
    t.column "site_controller_id", :integer, :default => 0,  :null => false
    t.column "name",               :string,  :default => "", :null => false
    t.column "permission_id",      :integer
    t.column "url_to_use",         :string
  end

  add_index "controller_actions", ["permission_id"], :name => "fk_controller_action_permission_id"
  add_index "controller_actions", ["site_controller_id"], :name => "fk_controller_action_site_controller_id"

  create_table "courses", :force => true do |t|
    t.column "name",           :string
    t.column "instructor_id",  :integer
    t.column "directory_path", :string
    t.column "info",           :text
    t.column "created_at",     :datetime
    t.column "updated_at",     :datetime
    t.column "private",        :boolean,  :default => false, :null => false
  end

  add_index "courses", ["instructor_id"], :name => "fk_course_users"

  create_table "deadline_rights", :force => true do |t|
    t.column "name", :string, :limit => 32
  end

  create_table "deadline_types", :force => true do |t|
    t.column "name", :string, :limit => 32
  end

  create_table "due_dates", :force => true do |t|
    t.column "due_at",                      :datetime
    t.column "deadline_type_id",            :integer
    t.column "assignment_id",               :integer
    t.column "late_policy_id",              :integer
    t.column "submission_allowed_id",       :integer
    t.column "review_allowed_id",           :integer
    t.column "resubmission_allowed_id",     :integer
    t.column "rereview_allowed_id",         :integer
    t.column "review_of_review_allowed_id", :integer
    t.column "round",                       :integer
  end

  add_index "due_dates", ["deadline_type_id"], :name => "fk_deadline_type_due_date"
  add_index "due_dates", ["assignment_id"], :name => "fk_due_dates_assignments"
  add_index "due_dates", ["late_policy_id"], :name => "fk_due_date_late_policies"
  add_index "due_dates", ["submission_allowed_id"], :name => "fk_due_date_submission_allowed"
  add_index "due_dates", ["review_allowed_id"], :name => "fk_due_date_review_allowed"
  add_index "due_dates", ["resubmission_allowed_id"], :name => "fk_due_date_resubmission_allowed"
  add_index "due_dates", ["rereview_allowed_id"], :name => "fk_due_date_rereview_allowed"
  add_index "due_dates", ["review_of_review_allowed_id"], :name => "fk_due_date_review_of_review_allowed"

  create_table "goldberg_content_pages", :force => true do |t|
    t.column "title",           :string
    t.column "name",            :string,   :default => "", :null => false
    t.column "markup_style_id", :integer
    t.column "content",         :text
    t.column "permission_id",   :integer,  :default => 0,  :null => false
    t.column "created_at",      :datetime
    t.column "updated_at",      :datetime
    t.column "content_cache",   :text
    t.column "markup_style",    :string
  end

  add_index "goldberg_content_pages", ["permission_id"], :name => "fk_content_page_permission_id"
  add_index "goldberg_content_pages", ["markup_style_id"], :name => "fk_content_page_markup_style_id"

  create_table "goldberg_controller_actions", :force => true do |t|
    t.column "site_controller_id", :integer, :default => 0,  :null => false
    t.column "name",               :string,  :default => "", :null => false
    t.column "permission_id",      :integer
    t.column "url_to_use",         :string
  end

  add_index "goldberg_controller_actions", ["permission_id"], :name => "fk_controller_action_permission_id"
  add_index "goldberg_controller_actions", ["site_controller_id"], :name => "fk_controller_action_site_controller_id"

  create_table "goldberg_markup_styles", :force => true do |t|
    t.column "name", :string, :default => "", :null => false
  end

  create_table "goldberg_menu_items", :force => true do |t|
    t.column "parent_id",            :integer
    t.column "name",                 :string,  :default => "", :null => false
    t.column "label",                :string,  :default => "", :null => false
    t.column "seq",                  :integer
    t.column "controller_action_id", :integer
    t.column "content_page_id",      :integer
  end

  add_index "goldberg_menu_items", ["controller_action_id"], :name => "fk_menu_item_controller_action_id"
  add_index "goldberg_menu_items", ["content_page_id"], :name => "fk_menu_item_content_page_id"
  add_index "goldberg_menu_items", ["parent_id"], :name => "fk_menu_item_parent_id"

  create_table "goldberg_permissions", :force => true do |t|
    t.column "name", :string, :default => "", :null => false
  end

  create_table "goldberg_roles", :force => true do |t|
    t.column "name",            :string,   :default => "", :null => false
    t.column "parent_id",       :integer
    t.column "description",     :string,   :default => "", :null => false
    t.column "default_page_id", :integer
    t.column "cache",           :text
    t.column "created_at",      :datetime
    t.column "updated_at",      :datetime
    t.column "start_path",      :string
  end

  add_index "goldberg_roles", ["parent_id"], :name => "fk_role_parent_id"
  add_index "goldberg_roles", ["default_page_id"], :name => "fk_role_default_page_id"

  create_table "goldberg_roles_permissions", :force => true do |t|
    t.column "role_id",       :integer, :default => 0, :null => false
    t.column "permission_id", :integer, :default => 0, :null => false
  end

  add_index "goldberg_roles_permissions", ["role_id"], :name => "fk_roles_permission_role_id"
  add_index "goldberg_roles_permissions", ["permission_id"], :name => "fk_roles_permission_permission_id"

  create_table "goldberg_site_controllers", :force => true do |t|
    t.column "name",          :string,  :default => "", :null => false
    t.column "permission_id", :integer, :default => 0,  :null => false
    t.column "builtin",       :integer, :default => 0
  end

  add_index "goldberg_site_controllers", ["permission_id"], :name => "fk_site_controller_permission_id"

  create_table "goldberg_system_settings", :force => true do |t|
    t.column "site_name",                           :string,  :default => "", :null => false
    t.column "site_subtitle",                       :string
    t.column "footer_message",                      :string,  :default => ""
    t.column "public_role_id",                      :integer, :default => 0,  :null => false
    t.column "session_timeout",                     :integer, :default => 0,  :null => false
    t.column "default_markup_style_id",             :integer, :default => 0
    t.column "site_default_page_id",                :integer, :default => 0,  :null => false
    t.column "not_found_page_id",                   :integer, :default => 0,  :null => false
    t.column "permission_denied_page_id",           :integer, :default => 0,  :null => false
    t.column "session_expired_page_id",             :integer, :default => 0,  :null => false
    t.column "menu_depth",                          :integer, :default => 0,  :null => false
    t.column "start_path",                          :string
    t.column "site_url_prefix",                     :string
    t.column "self_reg_enabled",                    :boolean
    t.column "self_reg_role_id",                    :integer
    t.column "self_reg_confirmation_required",      :boolean
    t.column "self_reg_confirmation_error_page_id", :integer
    t.column "self_reg_send_confirmation_email",    :boolean
  end

  add_index "goldberg_system_settings", ["public_role_id"], :name => "fk_system_settings_public_role_id"
  add_index "goldberg_system_settings", ["site_default_page_id"], :name => "fk_system_settings_site_default_page_id"
  add_index "goldberg_system_settings", ["not_found_page_id"], :name => "fk_system_settings_not_found_page_id"
  add_index "goldberg_system_settings", ["permission_denied_page_id"], :name => "fk_system_settings_permission_denied_page_id"
  add_index "goldberg_system_settings", ["session_expired_page_id"], :name => "fk_system_settings_session_expired_page_id"

  create_table "goldberg_users", :force => true do |t|
    t.column "name",                           :string,                 :default => "", :null => false
    t.column "password",                       :string,   :limit => 40, :default => "", :null => false
    t.column "role_id",                        :integer,                :default => 0,  :null => false
    t.column "password_salt",                  :string
    t.column "fullname",                       :string
    t.column "email",                          :string
    t.column "start_path",                     :string
    t.column "self_reg_confirmation_required", :boolean
    t.column "confirmation_key",               :string
    t.column "password_changed_at",            :datetime
    t.column "password_expired",               :boolean
  end

  add_index "goldberg_users", ["role_id"], :name => "fk_user_role_id"

  create_table "institutions", :force => true do |t|
    t.column "name", :string, :default => "", :null => false
  end

  create_table "invitations", :force => true do |t|
    t.column "assignment_id", :integer
    t.column "from_id",       :integer
    t.column "to_id",         :integer
    t.column "reply_status",  :string,  :limit => 1
  end

  add_index "invitations", ["from_id"], :name => "fk_invitationfrom_users"
  add_index "invitations", ["to_id"], :name => "fk_invitationto_users"
  add_index "invitations", ["assignment_id"], :name => "fk_invitation_assignments"

  create_table "languages", :force => true do |t|
    t.column "name", :string, :limit => 32
  end

  create_table "late_policies", :force => true do |t|
    t.column "penalty_period_in_minutes", :integer
    t.column "penalty_per_unit",          :integer
    t.column "expressed_as_percentage",   :boolean
    t.column "max_penalty",               :integer, :default => 0, :null => false
  end

  add_index "late_policies", ["penalty_period_in_minutes"], :name => "penalty_period_length_unit"

  create_table "mapping_strategies", :force => true do |t|
    t.column "name", :string
  end

  create_table "markup_styles", :force => true do |t|
    t.column "name", :string, :default => "", :null => false
  end

  create_table "menu_items", :force => true do |t|
    t.column "parent_id",            :integer
    t.column "name",                 :string,  :default => "", :null => false
    t.column "label",                :string,  :default => "", :null => false
    t.column "seq",                  :integer
    t.column "controller_action_id", :integer
    t.column "content_page_id",      :integer
  end

  add_index "menu_items", ["controller_action_id"], :name => "fk_menu_item_controller_action_id"
  add_index "menu_items", ["content_page_id"], :name => "fk_menu_item_content_page_id"
  add_index "menu_items", ["parent_id"], :name => "fk_menu_item_parent_id"

  create_table "nodes", :force => true do |t|
    t.column "parent_id",      :integer
    t.column "node_object_id", :integer
    t.column "type",           :string
  end

  create_table "participants", :force => true do |t|
    t.column "submit_allowed",      :boolean,                :default => true
    t.column "review_allowed",      :boolean,                :default => true
    t.column "user_id",             :integer
    t.column "parent_id",           :integer
    t.column "directory_num",       :integer
    t.column "submitted_at",        :datetime
    t.column "topic",               :string
    t.column "permission_granted",  :boolean
    t.column "penalty_accumulated", :integer,  :limit => 10, :default => 0,    :null => false
    t.column "submitted_hyperlink", :text
    t.column "grade",               :float
    t.column "type",                :string
  end

  add_index "participants", ["user_id"], :name => "fk_participant_users"

  create_table "permissions", :force => true do |t|
    t.column "name", :string, :default => "", :null => false
  end

  create_table "plugin_schema_info", :id => false, :force => true do |t|
    t.column "plugin_name", :string
    t.column "version",     :integer
  end

  create_table "question_advices", :force => true do |t|
    t.column "question_id", :integer
    t.column "score",       :integer
    t.column "advice",      :text
  end

  add_index "question_advices", ["question_id"], :name => "fk_question_question_advices"

  create_table "questionnaire_types", :force => true do |t|
    t.column "name", :string, :default => "", :null => false
  end

  create_table "questionnaires", :force => true do |t|
    t.column "name",                :string,   :limit => 64
    t.column "instructor_id",       :integer,                :default => 0,     :null => false
    t.column "private",             :boolean,                :default => false, :null => false
    t.column "min_question_score",  :integer,                :default => 0,     :null => false
    t.column "max_question_score",  :integer
    t.column "created_at",          :datetime
    t.column "updated_at",          :datetime,                                  :null => false
    t.column "default_num_choices", :integer
    t.column "type_id",             :integer,                :default => 0,     :null => false
  end

  create_table "questions", :force => true do |t|
    t.column "txt",              :text
    t.column "true_false",       :boolean
    t.column "weight",           :integer
    t.column "questionnaire_id", :integer
  end

  add_index "questions", ["questionnaire_id"], :name => "fk_question_questionnaires"

  create_table "resubmission_times", :force => true do |t|
    t.column "participant_id", :integer
    t.column "resubmitted_at", :datetime
  end

  add_index "resubmission_times", ["participant_id"], :name => "fk_resubmission_times_participants"

  create_table "review_feedbacks", :force => true do |t|
    t.column "assignment_id",      :integer
    t.column "review_id",          :integer
    t.column "user_id",            :integer
    t.column "feedback_at",        :datetime
    t.column "txt",                :text
    t.column "additional_comment", :text
    t.column "author_id",          :integer
    t.column "team_id",            :integer
  end

  add_index "review_feedbacks", ["assignment_id"], :name => "fk_review_feedback_assignments"
  add_index "review_feedbacks", ["review_id"], :name => "fk_review_feedback_reviews"

  create_table "review_mappings", :force => true do |t|
    t.column "author_id",     :integer
    t.column "team_id",       :integer
    t.column "reviewer_id",   :integer
    t.column "assignment_id", :integer
    t.column "round",         :integer
  end

  add_index "review_mappings", ["assignment_id"], :name => "fk_review_mapping_assignments"

  create_table "review_of_review_mappings", :force => true do |t|
    t.column "review_reviewer_id", :integer, :limit => 10
    t.column "review_mapping_id",  :integer
    t.column "reviewer_id",        :integer
  end

  add_index "review_of_review_mappings", ["review_mapping_id"], :name => "fk_review_of_review_mapping_review_mappings"

  create_table "review_of_reviews", :force => true do |t|
    t.column "reviewed_at",                 :datetime
    t.column "review_of_review_mapping_id", :integer
    t.column "review_num_for_author",       :integer
    t.column "review_num_for_reviewer",     :integer
    t.column "created_at",                  :datetime
    t.column "updated_at",                  :datetime
  end

  add_index "review_of_reviews", ["review_of_review_mapping_id"], :name => "fk_review_of_review_review_of_review_mappings"

  create_table "review_strategies", :force => true do |t|
    t.column "name", :string
  end

  create_table "reviews", :force => true do |t|
    t.column "review_mapping_id",       :integer
    t.column "review_num_for_author",   :integer
    t.column "review_num_for_reviewer", :integer
    t.column "ignore",                  :integer,  :limit => 4, :default => 0, :null => false
    t.column "additional_comment",      :text
    t.column "updated_at",              :datetime
    t.column "created_at",              :datetime
  end

  add_index "reviews", ["review_mapping_id"], :name => "fk_review_mappings"

  create_table "roles", :force => true do |t|
    t.column "name",            :string,   :default => "", :null => false
    t.column "parent_id",       :integer
    t.column "description",     :string,   :default => "", :null => false
    t.column "default_page_id", :integer
    t.column "cache",           :text
    t.column "created_at",      :datetime
    t.column "updated_at",      :datetime
  end

  add_index "roles", ["parent_id"], :name => "fk_role_parent_id"
  add_index "roles", ["default_page_id"], :name => "fk_role_default_page_id"

  create_table "roles_permissions", :force => true do |t|
    t.column "role_id",       :integer, :default => 0, :null => false
    t.column "permission_id", :integer, :default => 0, :null => false
  end

  add_index "roles_permissions", ["role_id"], :name => "fk_roles_permission_role_id"
  add_index "roles_permissions", ["permission_id"], :name => "fk_roles_permission_permission_id"

  create_table "scores", :force => true do |t|
    t.column "instance_id",           :integer, :null => false
    t.column "question_id",           :integer, :null => false
    t.column "questionnaire_type_id", :integer, :null => false
    t.column "score",                 :integer
    t.column "comments",              :text
  end

  add_index "scores", ["question_id"], :name => "fk_score_questions"
  add_index "scores", ["questionnaire_type_id"], :name => "fk_score_questionnaire_types"

  create_table "site_controllers", :force => true do |t|
    t.column "name",          :string,  :default => "", :null => false
    t.column "permission_id", :integer, :default => 0,  :null => false
    t.column "builtin",       :integer, :default => 0
  end

  add_index "site_controllers", ["permission_id"], :name => "fk_site_controller_permission_id"

  create_table "survey_deployments", :force => true do |t|
    t.column "course_evaluation_id", :integer
    t.column "start_date",           :datetime
    t.column "end_date",             :datetime
    t.column "num_of_students",      :integer
    t.column "last_reminder",        :datetime
    t.column "course_id",            :integer,  :default => 0, :null => false
  end

  create_table "survey_participants", :force => true do |t|
    t.column "user_id",              :integer
    t.column "survey_deployment_id", :integer
  end

  create_table "survey_responses", :force => true do |t|
    t.column "score",                :integer, :limit => 10
    t.column "comments",             :text
    t.column "assignment_id",        :integer, :limit => 10, :default => 0, :null => false
    t.column "question_id",          :integer, :limit => 10, :default => 0, :null => false
    t.column "survey_id",            :integer, :limit => 10, :default => 0, :null => false
    t.column "email",                :string
    t.column "survey_deployment_id", :integer
  end

  create_table "system_settings", :force => true do |t|
    t.column "site_name",                 :string,  :default => "", :null => false
    t.column "site_subtitle",             :string
    t.column "footer_message",            :string,  :default => ""
    t.column "public_role_id",            :integer, :default => 0,  :null => false
    t.column "session_timeout",           :integer, :default => 0,  :null => false
    t.column "default_markup_style_id",   :integer, :default => 0
    t.column "site_default_page_id",      :integer, :default => 0,  :null => false
    t.column "not_found_page_id",         :integer, :default => 0,  :null => false
    t.column "permission_denied_page_id", :integer, :default => 0,  :null => false
    t.column "session_expired_page_id",   :integer, :default => 0,  :null => false
    t.column "menu_depth",                :integer, :default => 0,  :null => false
  end

  add_index "system_settings", ["public_role_id"], :name => "fk_system_settings_public_role_id"
  add_index "system_settings", ["site_default_page_id"], :name => "fk_system_settings_site_default_page_id"
  add_index "system_settings", ["not_found_page_id"], :name => "fk_system_settings_not_found_page_id"
  add_index "system_settings", ["permission_denied_page_id"], :name => "fk_system_settings_permission_denied_page_id"
  add_index "system_settings", ["session_expired_page_id"], :name => "fk_system_settings_session_expired_page_id"

  create_table "ta_mappings", :force => true do |t|
    t.column "ta_id",     :integer
    t.column "course_id", :integer
  end

  add_index "ta_mappings", ["ta_id"], :name => "fk_ta_mappings_ta_id"
  add_index "ta_mappings", ["course_id"], :name => "fk_ta_mappings_course_id"

  create_table "teammate_reviews", :force => true do |t|
    t.column "reviewer_id",        :integer
    t.column "reviewee_id",        :integer
    t.column "assignment_id",      :integer
    t.column "additional_comment", :text
  end

  add_index "teammate_reviews", ["reviewer_id"], :name => "fk_reviewer_id_users"
  add_index "teammate_reviews", ["reviewee_id"], :name => "fk_reviewee_id_users"
  add_index "teammate_reviews", ["assignment_id"], :name => "fk_teammate_reviews_assignments"

  create_table "teams", :force => true do |t|
    t.column "name",      :string
    t.column "parent_id", :integer
    t.column "type",      :string
  end

  create_table "teams_users", :force => true do |t|
    t.column "team_id", :integer
    t.column "user_id", :integer
  end

  add_index "teams_users", ["team_id"], :name => "fk_users_teams"
  add_index "teams_users", ["user_id"], :name => "fk_teams_users"

  create_table "tree_folders", :force => true do |t|
    t.column "name",       :string
    t.column "child_type", :string
  end

  create_table "users", :force => true do |t|
    t.column "name",                      :string,                 :default => "",    :null => false
    t.column "password",                  :string,  :limit => 40,  :default => "",    :null => false
    t.column "role_id",                   :integer,                :default => 0,     :null => false
    t.column "password_salt",             :string
    t.column "fullname",                  :string
    t.column "email",                     :string
    t.column "parent_id",                 :integer
    t.column "private_by_default",        :boolean,                :default => false
    t.column "mru_directory_path",        :string,  :limit => 128
    t.column "email_on_review",           :boolean
    t.column "email_on_submission",       :boolean
    t.column "email_on_review_of_review", :boolean
    t.column "is_new_user",               :boolean,                :default => true,  :null => false
    t.column "master_permission_granted", :integer, :limit => 4,   :default => 0
  end

  add_index "users", ["role_id"], :name => "fk_user_role_id"

  create_table "wiki_types", :force => true do |t|
    t.column "name", :string, :default => "", :null => false
  end

end
