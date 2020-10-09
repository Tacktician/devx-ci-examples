FROM saucelabs/stt-puppeteer-jest-node:v0.1.8
COPY . /home/seluser
CMD ["./entry.sh"]