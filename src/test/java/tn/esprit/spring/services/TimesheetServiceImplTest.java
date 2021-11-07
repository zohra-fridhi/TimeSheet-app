package tn.esprit.spring.services;

import org.junit.Test;
import org.mockito.ArgumentMatchers;
import org.mockito.Mock;
import org.mockito.Mockito;
import tn.esprit.spring.entities.Mission;
import tn.esprit.spring.repository.MissionRepository;

import static org.junit.Assert.*;

public class TimesheetServiceImplTest {
    @Mock
    MissionRepository missionRepository;
    @Test
    public void ajouterMission() {
        //Mockito.when(missionRepository.save(ArgumentMatchers.any())).then(new Mission());
    }

    @Test
    public void affecterMissionADepartement() {
    }

    @Test
    public void ajouterTimesheet() {
    }

    @Test
    public void validerTimesheet() {
    }

    @Test
    public void findAllMissionByEmployeJPQL() {
    }

    @Test
    public void getAllEmployeByMission() {
    }
}