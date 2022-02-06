FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install wget -y

RUN wget https://gist.githubusercontent.com/lesstif/8185f143ba7b8881e767900b1c8e98ad/raw/b749a8fc590ad2391fd0f8849417eeec998b33a7/change-ubuntu-mirror.sh
RUN chmod +x change-ubuntu-mirror.sh
RUN ./change-ubuntu-mirror.sh -k

RUN apt-get update
RUN apt-get install samba samba-common-bin -y

COPY ./smb.cnf /etc/samba/smb.cnf
COPY ./smb.cnf /etc/samba/smb.conf
COPY ./init.sh /init.sh

EXPOSE 137/udp
EXPOSE 138/udp
EXPOSE 139
EXPOSE 445

RUN /init.sh
CMD ["smbd", "--foreground", "--log-stdout", "--no-process-group"]
