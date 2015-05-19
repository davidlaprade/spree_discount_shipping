Deface::Override.new(:virtual_path => "spree/admin/shipping_methods/_form",
                     :name => "add_discounts_to_shipping_methods",
                     :insert_bottom => "div[data-hook='admin_shipping_method_form_fields']",
                     :text => %q{<div class="four columns">
    <%= f.field_container :discount do %>
      <%= f.label :discount, 'discount %' %><br />
      <%= f.number_field :discount, in: 0..100, step: 5, class: 'fullwidth' %>
      <%= error_message_on :shipping_method, :discount %>
    <% end %>
  </div>})