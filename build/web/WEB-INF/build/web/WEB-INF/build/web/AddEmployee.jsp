<%@page import="java.util.StringTokenizer"%>
<%@page import="java.util.Scanner"%>
<%@ page import="java.io.*" %>
<HTML>
    <HEAD>
        <TITLE>Employee Added</TITLE>
    </HEAD>

    <BODY>
        <H1>Employee Added Successfully</H1>
        
        <FORM ACTION="AddEmployee.jsp" METHOD="POST">
            <INPUT TYPE="SUBMIT" VALUE="Display Employee" NAME="button">
        </FORM>
        
        <BR>
        <%
            File f = new File("D:/Coop/JSPServlet/MyDB.txt");
		
		//If the file does not exist, then create
		if (!f.exists()){
			f.createNewFile();
		}
                
            String fname = request.getParameter("TEXT1");
            String lname = request.getParameter("TEXT2");
            String empid = request.getParameter("TEXT3");
            String salary = request.getParameter("TEXT4");
            
            //String file = application.getRealPath("/") + "test.txt";
            if(fname!= null && lname != null && empid != null && salary !=null){
                
                FileWriter filewriter = new FileWriter(f, true);
            filewriter.append("Name: " + fname);
            filewriter.append(", Last Name: " +lname);
            filewriter.append(", Employee ID: "+empid);
            filewriter.append(", Salary: " + salary);
            filewriter.append(System.lineSeparator());
            filewriter.close();
                
            }
    
            
            
            //Reading File
             String button = request.getParameter("button");
             
             if("Display Employee".equals(button)){
                 Scanner fileScanner = new Scanner(f);
		for(;fileScanner.hasNextLine();){
			String line = fileScanner.nextLine();
			
			StringTokenizer st = new StringTokenizer(line, ",");
			for(;st.hasMoreTokens();){
				//System.out.println(st.nextToken());
                                out.println("<p>");
                                 out.println(st.nextToken());
                                 out.println("<p>");
			}
			
		}
                 
             }
            
            
        %>
        <jsp:include page="ch15_04.txt" flush="true"/>
        
        
    </BODY>
</HTML>