---
layout: post
title:  "UnicodeEncodeError при FileField.save"
date:   2014-04-25 10:13:10
categories: python django
tags:  programming
permalink: /16.unicodeencodeerror-pri-filefieldsave.html
---

Если вы столкнулись с похожей ошибкой:

> UnicodeEncodeError: 'ascii' codec can't encode character u'\xe7' in position 52: ordinal not in range(128)

Проблема заключается в том, что в env python-а не установлен язык. Решается проблема таким образом (Для конфига supervisord):

{% highlight ini %}
env = LANG=en_US.UTF-8
{% endhighlight %}

Или, если у вас wsgi-приложение - где-то в начале файла написать:

{% highlight python %}
import os
os.environ['LANG'] = 'en_US.UTF-8'
{% endhighlight %}

Иногда похожая ошибка (тогда всплывает `UnicodeDecodeError`) возникается при попытке сделать:

{% highlight python %}
print(u'какие-то юникодные символы')
{% endhighlight %}

Проблема в том, что python не может декодировать то, что вы пытаетесь вывести в stdout.
Тогда нужно ещё и дописать в env такое:

{% highlight ini %}
PYTHONIOENCODING=UTF-8
{% endhighlight %}