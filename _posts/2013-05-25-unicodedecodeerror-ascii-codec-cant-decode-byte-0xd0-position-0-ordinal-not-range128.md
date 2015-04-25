---
layout: post
title:  "UnicodeDecodeError 'ascii' codec can't decode byte 0xd0 in position 0: ordinal not in range(128)"
date:   2013-09-08 14:52:25
categories: python django
permalink: /9.unicodedecodeerror-ascii-codec-cant-decode-byte-0xd0-position-0-ordinal-not-range128.html
---

Всплыла сегодня такая ошибка при редактировании модели в админке Django.
Решение лежит по адресу:

{% highlight python %}
from django.utils.encoding import smart_unicode
{% endhighlight %}

Нужно просто обернуть то что возвращает метод `__unicode__` проблемной модели в `smart_unicode`.
То есть, было:

{% highlight python %}
def __unicode__(self):
    return self.title
{% endhighlight %}

Стало:

{% highlight python %}
def __unicode__(self):
    return smart_unicode(self.title)
{% endhighlight %}

*ToDo: Написать больше о причинах и как бороться с этим*