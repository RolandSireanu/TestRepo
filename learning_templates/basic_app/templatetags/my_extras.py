from django import template 

register = template.Library()

@register.filter(name='cut')
def cut(value, arg):
    """
        This cuts out all vals of args from string 
    """

    return value.replace(arg , "")