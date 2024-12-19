package com.spring.professional.exam.tutorial.module01.question01.no.dependency.injection;

import com.spring.professional.exam.tutorial.module01.question01.commons.report.PdfSalaryReport;
import com.spring.professional.exam.tutorial.module01.question01.commons.report.XlsSalaryReport;

public class Runner {
    public static void main(String... args) {
        EmployeesSalariesReportService employeesSalariesReportService = new EmployeesSalariesReportService(new XlsSalaryReport());

        employeesSalariesReportService.generateReport();
    }
}
