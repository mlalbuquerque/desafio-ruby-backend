# frozen_string_literal: true

class Select2RemoteMultipleInput < Select2RemoteInput
  def new_html_options
    super.merge(multiple: true)
  end
end
