# GIAI DOAN 1: Xuong moc (Dung JDK nang de bien dich code)
FROM eclipse-temurin:17-jdk-jammy AS xuong_moc
WORKDIR /app
COPY Main.java .
RUN javac Main.java

# GIAI DOAN 2: Cua hang (Chi lay thanh pham, dung JRE nhe de chay)
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
# Chi copy file Main.class tu xuong_moc sang, vut bo toan bo JDK nang ne
COPY --from=xuong_moc /app/Main.class .
CMD ["java", "Main"]
