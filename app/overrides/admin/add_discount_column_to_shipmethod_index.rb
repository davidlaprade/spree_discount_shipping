Deface::Override.new(:virtual_path => "spree/admin/shipping_methods/index",
                     :name => "add_discount_column_to_shipmethod_index",
                     :replace_contents => "table#listing_shipping_methods > colgroup",
                     :text => %q{      <col style="width: 20%">
      <col style="width: 15%">
      <col style="width: 30%">
      <col style="width: 10%">
      <col style="width: 10%">
      <col style="width: 15%">})