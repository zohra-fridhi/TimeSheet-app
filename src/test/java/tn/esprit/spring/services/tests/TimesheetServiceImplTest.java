package tn.esprit.spring.services.tests;

import lombok.extern.slf4j.Slf4j;
import org.hibernate.exception.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.test.context.junit4.SpringRunner;
import tn.esprit.spring.entities.Timesheet;
import tn.esprit.spring.entities.TimesheetPK;
import tn.esprit.spring.repository.TimesheetRepository;
import tn.esprit.spring.services.TimesheetServiceImpl;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.Calendar;
import java.util.Date;

@RunWith(SpringRunner.class)
@SpringBootTest

public class TimesheetServiceImplTest {

    @Autowired
    private TimesheetServiceImpl ts;
    @Autowired
    private TimesheetRepository tr;

    @Rule
    public final ExpectedException exception = ExpectedException.none();

    @Test
    public void ajouterTimesheet() {


        //Timesheet T = new Timesheet();
        Date dateDebut = new Date(2021, Calendar.OCTOBER, 30);
        Date dateFin = new Date(2022, Calendar.DECEMBER, 30);

        ts.ajouterTimesheet(1, 1, dateDebut, dateFin);
        Timesheet timesheet = tr.findBytimesheetPK(new TimesheetPK(1, 1, dateDebut, dateFin));
        Assert.assertNotNull(timesheet);
        Assert.assertEquals(timesheet.getTimesheetPK().getIdEmploye(), 1);
        Assert.assertEquals(timesheet.getTimesheetPK().getIdMission(), 1);
        tr.delete(timesheet);


    }
    @Test
    public void shouldGetExceptionWhenEmployeeDoesNotExist() {
        Date dateDebut = new Date(2021, Calendar.OCTOBER, 30);
        Date dateFin = new Date(2022, Calendar.DECEMBER, 30);
        exception.expect(DataIntegrityViolationException.class);

        ts.ajouterTimesheet(5, 1, dateDebut, dateFin);
    }
    @Test
    public void shouldGetExceptionWhenDateIsNull() {
        exception.expect(DataIntegrityViolationException.class);

        ts.ajouterTimesheet(1, 1, null, null);
    }

    @Test
    public void validerTimesheet() {
    }


}