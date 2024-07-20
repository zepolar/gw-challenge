FROM eclipse-temurin:17-jre-alpine

LABEL authors="zepolar"

RUN addgroup -S zepolar && adduser -S zepolar -G zepolar

RUN mkdir /app && chown zepolar:zepolar /app

WORKDIR /app

ENV PURCHASE_API="" \
    PURCHASE_PORT="80" \
    VEHICLE_API="" \
    VEHICLE_PORT="80" \
    CONVERSION_API="" \
    CONVERSION_PORT="80" \
    REPORT_API="" \
    REPORT_PORT="8084" \
    TZ="Europe/Rome" \
    LANG="en_US.UTF-8" \
    LANGUAGE="en_US:en"

COPY --chown=zepolar:zepolar ./target/gw-challenge-1.0.jar /app

USER zepolar

ENTRYPOINT ["java", "-jar", "gw-challenge-1.0.jar"]