{% set page_title = "标签 - " + config.title %}

{% extends 'default.swig' %}

{% block content %}

<h3 id="tags">标签</h3>
<p>{% for tag in site.tags %}<block class="izhengfan-tag"><a href="#{{ tag | first }}">{{ tag | first }} </a></block>{% endfor %}</p>

{% for tag in site.tags %}
<div>
<legend id="{{ tag.name }}">{{ tag.name }}</legend>
<ul>
{% for post in site.posts.sort('-date') %} {% set match_tag = false %}
{% for post_tag in post.tags %} {% if post_tag.name == tag.name %} {% set match_tag = true %} {% endif %} {% endfor %}
{% if match_tag && post.path %}
<p><span>{{ post.date | date("Y-m-d") }}</span> <a class="pjaxlink" href="{{ url_for(post.path) }}">{{ post.title | escape }}</a></p>
{% endif %}{% endfor %}</ul>
</div>
{% endfor %}

{% endblock %}
