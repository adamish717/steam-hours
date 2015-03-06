module Admin
  module PurchaseOrdersHelper

    def active_label active
      if active
        '<span class="label label-success">Active</span>'.html_safe
      else
        '<span class="label label-default">Inactive</span>'.html_safe
      end
    end
  end
end
