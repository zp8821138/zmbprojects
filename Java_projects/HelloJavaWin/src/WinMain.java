import javax.swing.JButton;
import javax.swing.JFrame;

public class WinMain extends JFrame {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		new WinMain().setVisible(true);
	}

	public WinMain() {
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setSize(550, 400);
		
		this.setLayout(null);
		JButton jb=new JButton("Click me");
		jb.setSize(100,25);
		jb.setLocation(100, 50);
		this.add(jb);
	}

}
