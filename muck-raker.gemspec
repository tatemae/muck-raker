# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{muck-raker}
  s.version = "0.3.18"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Joel Duffin Justin Ball"]
  s.date = %q{2010-10-14}
  s.description = %q{The aggregation and recommendation daemons for the muck system.}
  s.email = %q{justin@tatemae.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     "MIT-LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "config/initializers/muck_raker.rb",
     "config/muck_raker_environment.rb",
     "config/solr.yml",
     "config/solr/README.txt",
     "config/solr/cores/de/conf/protwords.txt",
     "config/solr/cores/de/conf/schema.xml",
     "config/solr/cores/de/conf/solrconfig.xml",
     "config/solr/cores/de/conf/stopwords.txt",
     "config/solr/cores/de/conf/synonyms.txt",
     "config/solr/cores/en/conf/protwords.txt",
     "config/solr/cores/en/conf/schema.xml",
     "config/solr/cores/en/conf/solrconfig.xml",
     "config/solr/cores/en/conf/stopwords.txt",
     "config/solr/cores/en/conf/synonyms.txt",
     "config/solr/cores/es/conf/protwords.txt",
     "config/solr/cores/es/conf/schema.xml",
     "config/solr/cores/es/conf/solrconfig.xml",
     "config/solr/cores/es/conf/stopwords.txt",
     "config/solr/cores/es/conf/synonyms.txt",
     "config/solr/cores/fr/conf/protwords.txt",
     "config/solr/cores/fr/conf/schema.xml",
     "config/solr/cores/fr/conf/solrconfig.xml",
     "config/solr/cores/fr/conf/stopwords.txt",
     "config/solr/cores/fr/conf/synonyms.txt",
     "config/solr/cores/ja/conf/protwords.txt",
     "config/solr/cores/ja/conf/schema.xml",
     "config/solr/cores/ja/conf/solrconfig.xml",
     "config/solr/cores/ja/conf/stopwords.txt",
     "config/solr/cores/ja/conf/synonyms.txt",
     "config/solr/cores/nl/conf/protwords.txt",
     "config/solr/cores/nl/conf/schema.xml",
     "config/solr/cores/nl/conf/solrconfig.xml",
     "config/solr/cores/nl/conf/stopwords.txt",
     "config/solr/cores/nl/conf/synonyms.txt",
     "config/solr/cores/ru/conf/protwords.txt",
     "config/solr/cores/ru/conf/schema.xml",
     "config/solr/cores/ru/conf/solrconfig.xml",
     "config/solr/cores/ru/conf/stopwords.txt",
     "config/solr/cores/ru/conf/synonyms.txt",
     "config/solr/cores/zh/conf/protwords.txt",
     "config/solr/cores/zh/conf/schema.xml",
     "config/solr/cores/zh/conf/solrconfig.xml",
     "config/solr/cores/zh/conf/stopwords.txt",
     "config/solr/cores/zh/conf/synonyms.txt",
     "config/solr/solr.xml",
     "db/bootstrap/attention.yml",
     "db/bootstrap/feeds.yml",
     "db/bootstrap/oai_endpoints.yml",
     "db/bootstrap/service_categories.yml",
     "db/bootstrap/services.yml",
     "db/migrate/20090602191243_create_muck_raker.rb",
     "db/migrate/20090619211125_create_tag_clouds.rb",
     "db/migrate/20090623181458_add_grain_size_to_entries.rb",
     "db/migrate/20090623193525_add_grain_size_to_tag_clouds.rb",
     "db/migrate/20090703175825_denormalize_entries_subjects.rb",
     "db/migrate/20090716035935_change_tag_cloud_grain_sizes.rb",
     "db/migrate/20090717173900_add_contributor_to_feeds.rb",
     "db/migrate/20090717175825_normalize_entries_subjects.rb",
     "db/migrate/20090721043213_change_services_title_to_name.rb",
     "db/migrate/20090721054927_remove_services_not_null_from_feeds.rb",
     "db/migrate/20090723050510_create_feed_parents.rb",
     "db/migrate/20090728165716_add_etag_to_feeds.rb",
     "db/migrate/20090730045848_add_comment_cache_to_entries.rb",
     "db/migrate/20090804211240_add_entry_id_to_shares.rb",
     "db/migrate/20090826220530_change_services_sequence_to_sort.rb",
     "db/migrate/20090826225652_create_identity_feeds.rb",
     "db/migrate/20090827005105_add_identity_fields_to_services.rb",
     "db/migrate/20090827015308_create_service_categories.rb",
     "db/migrate/20090827221502_add_prompt_and_template_to_services.rb",
     "db/migrate/20090915041650_aggregations_to_polymorphic.rb",
     "db/migrate/20090922174200_update_oai_endpoints.rb",
     "db/migrate/20090922231552_add_dates_to_oai_endpoints.rb",
     "db/migrate/20090923150807_rename_name_in_aggregation.rb",
     "db/migrate/20090924200750_add_uri_data_template_to_services.rb",
     "db/migrate/20091006183742_add_feed_count_to_aggregation.rb",
     "db/migrate/20091022150615_add_uri_key_to_services.rb",
     "lib/muck-raker.rb",
     "lib/muck-raker/engine.rb",
     "lib/muck-raker/tasks/muck-raker.rake",
     "muck-raker.gemspec",
     "raker/lib/aggregatord.jar",
     "raker/lib/aggregatord.properties",
     "raker/lib/axis.jar",
     "raker/lib/commons-daemon.jar",
     "raker/lib/commons-dbcp-1.2.1.jar",
     "raker/lib/commons-discovery-0.2.jar",
     "raker/lib/commons-pool-1.3.jar",
     "raker/lib/delicious-1.13.jar",
     "raker/lib/flickrapi-1.0a9.jar",
     "raker/lib/javax.jms.jar",
     "raker/lib/jaxrpc.jar",
     "raker/lib/jdom.jar",
     "raker/lib/jericho.jar",
     "raker/lib/log4j-1.2.8.jar",
     "raker/lib/mail.jar",
     "raker/lib/mysql-connector-java-5.1.10-bin.jar",
     "raker/lib/recommenderd.jar",
     "raker/lib/recommenderd.properties",
     "raker/lib/rome-1.0.jar",
     "raker/lib/rome.properties",
     "raker/lib/solr/apache-solr-common-1.3.0.jar",
     "raker/lib/solr/apache-solr-core-1.3.0.jar",
     "raker/lib/solr/apache-solr-dataimporthandler-1.3.0.jar",
     "raker/lib/solr/commons-codec-1.3.jar",
     "raker/lib/solr/commons-csv-1.0-SNAPSHOT-r609327.jar",
     "raker/lib/solr/commons-fileupload-1.2.jar",
     "raker/lib/solr/commons-httpclient-3.1.jar",
     "raker/lib/solr/commons-io-1.3.1.jar",
     "raker/lib/solr/commons-logging-1.0.4.jar",
     "raker/lib/solr/geronimo-stax-api_1.0_spec-1.0.1.jar",
     "raker/lib/solr/junit-4.3.jar",
     "raker/lib/solr/lucene-analyzers-2.4-dev.jar",
     "raker/lib/solr/lucene-core-2.4-dev.jar",
     "raker/lib/solr/lucene-highlighter-2.4-dev.jar",
     "raker/lib/solr/lucene-memory-2.4-dev.jar",
     "raker/lib/solr/lucene-queries-2.4-dev.jar",
     "raker/lib/solr/lucene-snowball-2.4-dev.jar",
     "raker/lib/solr/lucene-spellchecker-2.4-dev.jar",
     "raker/lib/solr/solr-commons-csv-pom.xml.template",
     "raker/lib/solr/solr-lucene-analyzers-pom.xml.template",
     "raker/lib/solr/solr-lucene-contrib-pom.xml.template",
     "raker/lib/solr/solr-lucene-core-pom.xml.template",
     "raker/lib/solr/solr-lucene-highlighter-pom.xml.template",
     "raker/lib/solr/solr-lucene-queries-pom.xml.template",
     "raker/lib/solr/solr-lucene-snowball-pom.xml.template",
     "raker/lib/solr/solr-lucene-spellchecker-pom.xml.template",
     "raker/lib/solr/stax-utils.jar",
     "raker/lib/solr/wstx-asl-3.2.7.jar",
     "raker/lib/wsdl4j-1.5.1.jar"
  ]
  s.homepage = %q{http://github.com/tatemae/muck-raker}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{muck-raker}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{The aggregation and recommendation daemons for the muck system}
  s.test_files = [
    "test/rails_test/app/controllers/application_controller.rb",
     "test/rails_test/app/controllers/default_controller.rb",
     "test/rails_test/app/helpers/application_helper.rb",
     "test/rails_test/app/models/comment.rb",
     "test/rails_test/app/models/profile.rb",
     "test/rails_test/app/models/user.rb",
     "test/rails_test/app/models/user_session.rb",
     "test/rails_test/config/application.rb",
     "test/rails_test/config/boot.rb",
     "test/rails_test/config/environment.rb",
     "test/rails_test/config/environments/development.rb",
     "test/rails_test/config/environments/production.rb",
     "test/rails_test/config/environments/test.rb",
     "test/rails_test/config/initializers/backtrace_silencers.rb",
     "test/rails_test/config/initializers/inflections.rb",
     "test/rails_test/config/initializers/mime_types.rb",
     "test/rails_test/config/initializers/muck.rb",
     "test/rails_test/config/initializers/secret_token.rb",
     "test/rails_test/config/initializers/session_store.rb",
     "test/rails_test/config/routes.rb",
     "test/rails_test/db/migrate/20090320174818_create_muck_permissions_and_roles.rb",
     "test/rails_test/db/migrate/20090402033319_add_muck_activities.rb",
     "test/rails_test/db/migrate/20090402234137_create_languages.rb",
     "test/rails_test/db/migrate/20090426041056_create_countries.rb",
     "test/rails_test/db/migrate/20090426041103_create_states.rb",
     "test/rails_test/db/migrate/20090602041838_create_users.rb",
     "test/rails_test/db/migrate/20090602191243_create_muck_raker.rb",
     "test/rails_test/db/migrate/20090613173314_create_comments.rb",
     "test/rails_test/db/migrate/20090619211125_create_tag_clouds.rb",
     "test/rails_test/db/migrate/20090623181458_add_grain_size_to_entries.rb",
     "test/rails_test/db/migrate/20090623193525_add_grain_size_to_tag_clouds.rb",
     "test/rails_test/db/migrate/20090703175825_denormalize_entries_subjects.rb",
     "test/rails_test/db/migrate/20090704220055_create_slugs.rb",
     "test/rails_test/db/migrate/20090704220120_acts_as_taggable_on_migration.rb",
     "test/rails_test/db/migrate/20090716035935_change_tag_cloud_grain_sizes.rb",
     "test/rails_test/db/migrate/20090717173900_add_contributor_to_feeds.rb",
     "test/rails_test/db/migrate/20090717175825_normalize_entries_subjects.rb",
     "test/rails_test/db/migrate/20090721043213_change_services_title_to_name.rb",
     "test/rails_test/db/migrate/20090721054927_remove_services_not_null_from_feeds.rb",
     "test/rails_test/db/migrate/20090723050510_create_feed_parents.rb",
     "test/rails_test/db/migrate/20090728165716_add_etag_to_feeds.rb",
     "test/rails_test/db/migrate/20090730044139_add_comment_cache.rb",
     "test/rails_test/db/migrate/20090730045848_add_comment_cache_to_entries.rb",
     "test/rails_test/db/migrate/20090730154102_allow_null_user.rb",
     "test/rails_test/db/migrate/20090803185323_create_shares.rb",
     "test/rails_test/db/migrate/20090804184247_add_comment_count_to_shares.rb",
     "test/rails_test/db/migrate/20090804211240_add_entry_id_to_shares.rb",
     "test/rails_test/db/migrate/20090804231857_add_shares_uri_index.rb",
     "test/rails_test/db/migrate/20090818204527_add_activity_indexes.rb",
     "test/rails_test/db/migrate/20090819030523_add_attachable_to_activities.rb",
     "test/rails_test/db/migrate/20090826220530_change_services_sequence_to_sort.rb",
     "test/rails_test/db/migrate/20090826225652_create_identity_feeds.rb",
     "test/rails_test/db/migrate/20090827005105_add_identity_fields_to_services.rb",
     "test/rails_test/db/migrate/20090827015308_create_service_categories.rb",
     "test/rails_test/db/migrate/20090827221502_add_prompt_and_template_to_services.rb",
     "test/rails_test/db/migrate/20090915041650_aggregations_to_polymorphic.rb",
     "test/rails_test/db/migrate/20090922174200_update_oai_endpoints.rb",
     "test/rails_test/db/migrate/20090922231552_add_dates_to_oai_endpoints.rb",
     "test/rails_test/db/migrate/20090923150807_rename_name_in_aggregation.rb",
     "test/rails_test/db/migrate/20090924200750_add_uri_data_template_to_services.rb",
     "test/rails_test/db/migrate/20091006183742_add_feed_count_to_aggregation.rb",
     "test/rails_test/db/migrate/20091022150615_add_uri_key_to_services.rb",
     "test/rails_test/features/step_definitions/comment_steps.rb",
     "test/rails_test/features/step_definitions/common_steps.rb",
     "test/rails_test/features/step_definitions/web_steps.rb",
     "test/rails_test/features/step_definitions/webrat_steps.rb",
     "test/rails_test/features/support/custom_env.rb",
     "test/rails_test/features/support/env.rb",
     "test/rails_test/features/support/paths.rb",
     "test/rails_test/public/dispatch.rb",
     "test/rails_test/spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

