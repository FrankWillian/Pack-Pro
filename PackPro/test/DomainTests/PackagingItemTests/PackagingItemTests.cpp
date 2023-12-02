#define CATCH_CONFIG_MAIN
#include "catch.hpp"
#include "opusmodbus.h"

TEST_CASE("OpusModBus Initialization", "[OpusModBus]") {
    OpusModBus opusModBus;

    SECTION("Default values") {
        REQUIRE(opusModBus.getIP() == "127.0.0.1");
        REQUIRE(opusModBus.getPort() == "502");
        REQUIRE(opusModBus.getReadStartAddr() == 0);
        REQUIRE(opusModBus.getReadNumValues() == 10);
        REQUIRE(opusModBus.getWriteStartAddr() == 0);
        REQUIRE(opusModBus.getWriteNumValues() == 10);
    }

    SECTION("ModBus Initialization") {
        opusModBus.initModBus();
        REQUIRE(opusModBus.modbusDevice != nullptr);
    }
}

TEST_CASE("OpusModBus Read and Write Requests", "[OpusModBus]") {
    OpusModBus opusModBus;

    SECTION("Read Request") {
        QModbusDataUnit readRequest = opusModBus.readRequest();
        REQUIRE(readRequest.registerType() == QModbusDataUnit::HoldingRegisters);
        REQUIRE(readRequest.startAddress() == 0);
        REQUIRE(readRequest.valueCount() == 10);
    }

    SECTION("Write Request") {
        QModbusDataUnit writeRequest = opusModBus.writeRequest();
        REQUIRE(writeRequest.registerType() == QModbusDataUnit::HoldingRegisters);
        REQUIRE(writeRequest.startAddress() == 0);
        REQUIRE(writeRequest.valueCount() == 10);
    }
}

TEST_CASE("OpusModBus Data Processing", "[OpusModBus]") {
    OpusModBus opusModBus;

    SECTION("Process Data") {
        // Assuming the data unit with sample values
        QModbusDataUnit dataUnit(QModbusDataUnit::HoldingRegisters, 0, 10);
        for (int i = 0; i < 10; ++i) {
            dataUnit.setValue(i, i * 100);
        }

        opusModBus.procData(&dataUnit);

        // TODO: Add assertions based on the expected behavior of procData function
        // Example: REQUIRE(opusModBus.someValue == expectedValue);
    }
}

// Add more test cases as needed...

