Deface::Override.new(:virtual_path => "spree/admin/shipping_methods/index",
                     :name => "add_discount_col_title_to_shipmethod_index",
                     :insert_after => "th:nth-child(4)",
                     :text => "<th>Discount</th>")