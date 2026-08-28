# --- GIAI DOAN 1: XUONG MOC ---
FROM eclipse-temurin:17-jdk-jammy AS builder
WORKDIR /app

# Cai dat cong cu wget va tai thu vien MySQL JDBC tu dong
RUN apt-get update && apt-get install -y wget
RUN wget -q https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/8.0.33/mysql-connector-j-8.0.33.jar

# Mang code vao va bien dich (co kem thu vien)
COPY Main.java .
RUN javac -cp mysql-connector-j-8.0.33.jar Main.java

# --- GIAI DOAN 2: CUA HANG ---
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app

# Chi lay thanh pham (file .class) va file thu vien (.jar) tu Xuong Moc sang
COPY --from=builder /app/Main.class .
COPY --from=builder /app/mysql-connector-j-8.0.33.jar .

# Chay ung dung
CMD ["java", "-cp", ".:mysql-connector-j-8.0.33.jar", "Main"]
