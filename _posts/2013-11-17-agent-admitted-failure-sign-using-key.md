---
layout: post
title:  "Agent admitted failure to sign using the key"
date:   2013-11-17 22:17:13
categories: ubuntu tip
tags: ssh linux ssh-agent
---

Если при подключении к ssh-серверу вы получаете ошибку:

> Agent admitted failure to sign using the key

Нужно просто выполнить:

{% highlight bash %}
ssh-add
{% endhighlight %}


А если получаете сообщение о том, что не запущен `ssh-agent` - нужно его запустить:

{% highlight bash %}
eval $(ssh-agent)
{% endhighlight %}