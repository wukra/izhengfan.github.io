<!DOCTYPE html>

{# Init Config #}
{% set title = page_title || config.title %}
{% set author = __('author') !== 'author' && __('author') || config.author %}
{% set description = __('description') !== 'description' && __('description') || config.description %}

<html>
<head>{% include 'head.swig' %}</head>
<body>
<div class="body-wrapper">
<div class="nav-header">
    <a href="{{ config.root }}">{{ config.title }}</a>
    {# social #}
    {% if theme.social %} |
    {% for name, link in theme.social %}
    <a href="{{ link.split('||')[0] | trim }}" target="_blank" title="{{ name }}">
    {% if theme.social_icons.enable %}
    <i class="fa fa-fw fa-{{ link.split('||')[1] | trim | default('globe') }}"></i>
    {% endif %}
    {% if not theme.social_icons.icons_only %}{{ name }}{% endif %}
    </a>
    {% endfor %}
    {% endif %}{# social #}
    {% if theme.enable_blogroll %} | <a href="/blogroll">BlogRoll </a>{% endif %}
    {% if theme.enable_about %} | <a href="/about">About </a>{% endif %}
</div>
<div class="main-body">
{% block content %}{% endblock %}
</div>
{% include 'footer.swig' %}
</body>
{% include '_partials/vendors.swig' %}
{% include '_partials/google-analytics.swig' %}
<script src="https://use.typekit.net/hvv6ahj.js"></script>
<script>try{Typekit.load({ async: true });}catch(e){}</script>
{% block custom_script %}{% endblock %}
</html>
