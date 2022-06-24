# frozen_string_literal: true

class Ckeditor::Picture < Ckeditor::Asset
  # for validation, see https://github.com/igorkasyanchuk/active_storage_validations

  def url_content
    rails_representation_url(storage_data.variant(resize: '80x80'), only_path: true)

    # Rails.application.routes.url_helpers.rails_representation_url(picture_of_car.variant(resize: "300x300"), only_path: true)

  end

  def url_thumb
    rails_representation_url(storage_data.variant(resize: '118x100'), only_path: true)
  end
end

