import org.junit.After;
import org.junit.Before;
public class DoubleAddingAspectTest {

    @Before
    public void setUp() throws Exception {
        Account account;
        account = new Account("Gulustan", 12345, 400);
    }

    @After
    public void tearDown() throws Exception {
        System.out.println("Finish Test");
    }

}