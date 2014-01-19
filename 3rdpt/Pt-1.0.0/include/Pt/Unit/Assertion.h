/*
 * Copyright (C) 2005-2008 by Dr. Marc Boris Duerner
 * 
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 * 
 * As a special exception, you may use this file as part of a free
 * software library without restriction. Specifically, if other files
 * instantiate templates or use macros or inline functions from this
 * file, or you compile this file and link it with other files to
 * produce an executable, this file does not by itself cause the
 * resulting executable to be covered by the GNU General Public
 * License. This exception does not however invalidate any other
 * reasons why the executable file might be covered by the GNU Library
 * General Public License.
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 */
#ifndef PT_UNIT_ASSERTION_H
#define PT_UNIT_ASSERTION_H

#include <Pt/Unit/Api.h>
#include "Pt/SourceInfo.h"
#include <stdexcept>
#include <iostream>

namespace Pt {

namespace Unit {

    /** @brief %Test %Assertion exception

        Assertions are modeled as an exception type, which is thrown by Unit
        tests when an assertion has failed. This class implements
        std::exception and overrides std::exception::what() to return an
        error message Besides the error message, Assertions can provide
        information where the exception was raised in the source code through
        a SourceInfo object. It is recommended to use the PT_UNIT_ASSERT
        for easy creation from a source info object.

        @code
            void myTest()
            {
                int ten = 5 + 5;
                PT_UNIT_ASSERT(ten == 10)
            }
        @endcode

        @ingroup unittest
    */
    class PT_UNIT_API Assertion
    {
        public:
            /** @brief Construct from a message and source info.

                Constructs a assertion exception from a message string
                and a source info object that describes where the
                assertion failed. Use the PT_UNIT_ASSERT macro instead
                of this constructor.

                @param what Error message
                @param si Info where the assertion failed
            */
            Assertion(const std::string& what, const SourceInfo& si);

            const Pt::SourceInfo& sourceInfo() const;

            const char* what() const  { return _what.c_str(); }

        private:
            Pt::SourceInfo _sourceInfo;
            std::string _what;
    };

    #define PT_UNIT_ASSERT(cond) \
        do { \
            if( !(cond) ) \
                throw Pt::Unit::Assertion(#cond, PT_SOURCEINFO); \
        } while (false)

    #define PT_UNIT_ASSERT_MSG(cond, what) \
        do { \
            if( !(cond) ) \
            { \
                std::ostringstream _pt_msg; \
                _pt_msg << what; \
                throw Pt::Unit::Assertion(_pt_msg.str(), PT_SOURCEINFO); \
            } \
        } while (false)

    #define PT_UNIT_ASSERT_EQUALS(value1, value2) \
        do { \
            if( ! ((value1) == (value2)) ) \
            { \
                std::ostringstream _pt_msg; \
                _pt_msg << "not equal: value1 (" #value1 ")=<" << value1 << "> value2 (" #value2 ")=<" << value2 << '>'; \
                throw Pt::Unit::Assertion(_pt_msg.str(), PT_SOURCEINFO); \
            } \
        } while (false)

    #define PT_UNIT_ASSERT_THROW(cond, EX) \
        do { \
            struct _pt_ex { }; \
            try \
            { \
                cond; \
                throw _pt_ex(); \
            } \
            catch(const _pt_ex &) \
            { \
                std::ostringstream _pt_msg; \
                _pt_msg << "exception of type " #EX " expected in " #cond; \
                throw Pt::Unit::Assertion(_pt_msg.str(), PT_SOURCEINFO); \
            } \
            catch(const EX &) \
            {} \
        } while (false)

    #define PT_UNIT_ASSERT_NOTHROW(cond) \
        do { \
            try { \
            \
                cond; \
            } \
            catch(const std::exception& e) \
            { \
                throw Pt::Unit::Assertion( \
                    std::string("unexpected exception of type ") + typeid(e).name() + ": " + e.what(), \
                    PT_SOURCEINFO); \
            } \
            catch(...) \
            { \
                throw Pt::Unit::Assertion("unexpected exception." , PT_SOURCEINFO); \
            } \
        } while (false)

    #define PT_UNIT_FAIL(what) \
        do { \
            std::ostringstream _pt_msg; \
            _pt_msg << what; \
            throw Pt::Unit::Assertion(_pt_msg.str(), PT_SOURCEINFO); \
        } while (false)

} // namespace Unit

} // namespace Pt

#endif  // PTV_UNIT_ASSERTION_H
