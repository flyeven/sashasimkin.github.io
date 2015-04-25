---
layout: post
title:  "Установка Pillow/Pil в Ubuntu, Windows"
date:   2013-09-09 21:48:47
categories: python ubuntu tip
permalink: /11.ustanovka-pillowpil-v-ubuntu.html
---

Чтоб не искать каждый раз, сохраню.

В систему нужно поставить:

{% highlight bash %}
sudo -i
apt-get install python-dev libjpeg62 libjpeg62-dev zlib1g-dev libfreetype6 libfreetype6-dev
ln -s /usr/lib/x86_64-linux-gnu/libjpeg.so /usr/lib
ln -s /usr/lib/x86_64-linux-gnu/libfreetype.so /usr/lib
ln -s /usr/lib/x86_64-linux-gnu/libz.so /usr/lib
{% endhighlight %}
И ставим Pil или Pillow, который, теперь уже удачно скомпилится.

{% highlight bash %}
pip install -U PIL
{% endhighlight %}
или

{% highlight bash %}
pip install -U Pillow
{% endhighlight %}

P.s: Для винды он не скомпилится, есть [бинарники](http://www.lfd.uci.edu/~gohlke/pythonlibs/#pil), которые нужно ставить.
И если используете virtualenv - при создании оной нужно указать --site-packages т.к. python из venv-a не найдёт Pil.