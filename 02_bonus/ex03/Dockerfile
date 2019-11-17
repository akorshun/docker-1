FROM debian

LABEL maintainer="bsatou@student.21-school.ru"

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y wget vim make git zsh git

ADD https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh .

USER root

RUN chmod 777 install.sh && ./install.sh && rm install.sh \
	&& cd ~ && echo "alias gccwww='gcc -Wall -Wextra -Werror \$*'" >> .zshrc

CMD zsh