#pragma once
#include "../vendor/include/aixlog.hpp"

inline void init_logger()
{
	AixLog::Log::init<AixLog::SinkCout>(AixLog::Severity::trace);
	LOG(TRACE, "Test") << "Logger with one cout log sink\n";
	LOG(INFO, "Test") << "Logger with one cout log sink\n";
	LOG(WARNING, "Test") << "Logger with one cout log sink\n";
	LOG(ERROR, "Test") << "Logger with one cout log sink\n";
	LOG(FATAL, "Test") << "Logger with one cout log sink\n";

	LOG(INFO) << COND(1 == true) << "Logger conditionals\n";
}
