FROM phusion/passenger-ruby24:0.9.28

CMD ["/sbin/my_init"]

RUN rm /etc/nginx/sites-enabled/default

COPY config/catchall_vhost.conf config/main_vhost.conf /etc/nginx/sites-enabled/

RUN rm -f /etc/service/nginx/down

USER app

COPY config/index_catchall.html /home/app/default/404.html

WORKDIR /home/app/

  COPY tmp/pages/raudo/Gemfile tmp/pages/raudo/Gemfile.lock ./raudo/

USER root

  WORKDIR /home/app/raudo/
  RUN bundle --without development test --jobs 4

USER app

COPY tmp/pages /home/app/

WORKDIR /home/app/

USER root

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
