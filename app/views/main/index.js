<%# app/views/students/index.js.erb %>
<% js = escape_javascript(
    render(partial: 'students/list', locals: { students: @students })
) %>
$("#filterrific_results").html("<%= js %>");