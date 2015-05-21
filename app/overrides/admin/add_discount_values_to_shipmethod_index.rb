Deface::Override.new(:virtual_path => "spree/admin/shipping_methods/index",
                     :name => "add_discount_values_to_shipmethod_index",
                     :insert_before => "td[data-hook='admin_shipping_methods_index_row_actions']",
                     :text => "<td class='align-center'><%= shipping_method.try(:discount) || 0 %>%</td>")