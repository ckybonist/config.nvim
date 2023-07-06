return {
  'tpope/vim-rails',
  config = function()
    local create_command = vim.api.nvim_create_user_command
    create_command('Eroutes', 'Einitializer', {})
    create_command('Egemfile', 'edit Gemfile', {})

    -- See rails-projections doc
    vim.g.rails_projections = {
      ['app/services/*.rb'] = {
        command = 'service',
        test = 'app/services/%i.rb',
        template = { 'class %S::%i\nend', 'module %S::%i\nend' },
      },
      ['app/jobs/*.rb'] = {
        command = 'job',
        test = 'spec/jobs/%i_spec.rb',
        template = 'class %S::%iWorker < ApplicationJob\nend',
      },
      ['app/forms/*.rb'] = {
        command = 'form',
        test = 'spec/forms/%S/%i_spec.rb',
        template = 'module %S\nclass %iForm < BaseForm\nend\nend',
        -- rubyHelper = 'validate',
      },
      ['app/graphql/types/*.rb'] = {
        command = 'typegql',
        test = 'spec/graphql/types/%i_type_spec.rb',
        template = 'module Types\n  class %iType < BaseObject\n end\nend',
        -- rubyHelper = 'graphql_name global_id_field field argument',
      },
      ['app/graphql/mutations/*.rb'] = {
        command = 'mutation',
        test = 'spec/graphql/mutations/%i_spec.rb',
        template = 'module Mutations\n  class %i < BaseMutation\n end\nend',
        -- rubyHelper = 'graphql_name global_id_field field argument',
      },
      ['app/api/*.rb'] = {
        command = 'api',
        test = 'spec/api/grape_api/v1/%p_spec.rb',
        template = 'module GrapeAPI::V1::%S\n  class %p < GrapeAPI::Base\n end\nend',
        -- rubyHelper = 'namespace desc params detail requires optional success failure',
      },
      ['extras/*.rb'] = {
        command = 'extra',
        test = 'spec/extras/{}_spec.rb',
        -- template = 'class {camelcase|capitalize|colons}\n end',
      },
      ['test/factories/*.rb'] = {
        command = 'factory',
        affinity = 'collection',
        alternate = 'app/models/%i.rb',
        test = 'spec/models/%i_spec.rb',
        template = 'FactoryBot.define do\n  factory =%i do\n  end\nend',
        -- rubyHelper = 'factory sequence',
      },
      ['spec/factories/*.rb'] = {
        command = 'factory',
        affinity = 'collection',
        alternate = 'app/models/%i.rb',
        test = 'spec/models/%i_spec.rb',
        template = 'FactoryBot.define do\n  factory =%i do\n  end\nend',
        -- rubyHelper = 'factory sequence',
      },
    }
  end,
}
