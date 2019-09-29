# frozen_string_literal: true

SimpleForm.setup do |config|
  # config.generate_additional_classes_for = ['field']

  config.wrappers :default, tag: 'div', class: '', error_class: 'has-error' do |b|
    b.use         :placeholder
    b.optional    :maxlength
    b.optional    :pattern
    b.optional    :min_max
    b.optional    :readonly

    b.wrapper tag: 'div', class: 'field' do |ba|
      ba.use :input, class: 'input'
      ba.optional :hint, wrap_with: { tag: 'p', class: 'help' }
      ba.optional :label, class: 'label', wrap_with: { tag: 'label', class: 'label' }
    end
  end

  config.wrappers :boolean, tag: 'div', class: 'control', error_class: 'has-error' do |b|
    b.wrapper :label, tag: 'label', class: 'checkbox' do |ba|
      ba.use :input, class: 'checkbox'
      ba.use :label_text
      ba.use :hint, wrap_with: { tag: 'p', class: 'help' }
    end
  end

  config.wrappers :inline_input, tag: 'div', class: 'field is-horizontal' do |b|
    b.wrapper :label, tag: 'div', class: 'field-label is-normal' do |bl|
      bl.optional :label, class: 'label'
    end
    b.wrapper :input, tag: 'div', class: 'field-body' do |bi|
      bi.wrapper :input, tag: 'div', class: 'field' do |bf|
        bf.use :input, class: 'input'
        bf.optional :hint, wrap_with: { tag: 'p', class: 'help' }
      end
    end
  end

  class StringInput < SimpleForm::Inputs::StringInput
    def input(wrapper_options)
      template.content_tag(:div, super, class: 'control')
    end
  end

  class TextInput < SimpleForm::Inputs::TextInput
    def input_html_classes
      super.push('textarea')
    end
  end
end
