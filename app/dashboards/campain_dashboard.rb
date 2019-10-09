# frozen_string_literal: true

require 'administrate/base_dashboard'

class CampainDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    manager: Field::BelongsTo.with_options(class_name: 'User'),
    image: Field::ActiveStorage,
    name: Field::String,
    created_at: ShortDateField,
    updated_at: ShortDateField,
    start_date: ShortDateField,
    end_date: ShortDateField,
    objective: Field::String,
    campain_type: Field::Number,
    product: Field::String,
    company: Field::Polymorphic.with_options(classes: [Company, Corporation]),
    manager_id: Field::Number
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    name
    manager
    created_at
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    name
    manager
    product
    campain_type
    company
    objective
    created_at
    updated_at
    start_date
    end_date
    image
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    manager
    name
    start_date
    end_date
    objective
    campain_type
    product
    company
    image
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how campains are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(campain)
  #   "Campain ##{campain.id}"
  # end
end
