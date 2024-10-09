package com.crimsonlogic.busbookingsystem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingerror.service.CodingErrorPdfInvoiceCreator;
import com.crimsonlogic.busbookingsystem.entity.Booking;
import com.crimsonlogic.busbookingsystem.entity.Bus;
import com.crimsonlogic.busbookingsystem.entity.Payment;
import com.crimsonlogic.busbookingsystem.entity.Schedule;
import com.crimsonlogic.busbookingsystem.entity.Ticket;
import com.crimsonlogic.busbookingsystem.entity.User;
import com.crimsonlogic.busbookingsystem.repository.BookingRepository;
import com.crimsonlogic.busbookingsystem.repository.PaymentRepository;
import com.crimsonlogic.busbookingsystem.repository.TicketRepository;
import com.itextpdf.io.image.ImageData;
import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.kernel.color.Color;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.border.Border;
import com.itextpdf.layout.border.DashedBorder;
import com.itextpdf.layout.border.SolidBorder;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Image;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.property.TextAlignment;
import com.codingerror.model.AddressDetails;
import com.codingerror.model.HeaderDetails;
import com.codingerror.model.Product;
import com.codingerror.model.ProductTableHeader;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Service
public class BookingService {
    @Autowired
    private BookingRepository bookingRepository;
    
    @Autowired
    private PaymentRepository paymentRepository;
    
    @Autowired
    private TicketRepository ticketRepository;
    
    @Autowired
    private ScheduleService scheduleService;
    
    @Autowired
    private BusService busService;

    public List<Booking> findAll() {
        return bookingRepository.findAll();
    }

    public Booking findById(String id) {
        return bookingRepository.findById(id).orElse(null);
    }

    public Booking save(Booking booking) {
        return bookingRepository.save(booking);
    }

    public void deleteById(String id) {
        bookingRepository.deleteById(id);
    }

    public List<Booking> getBookingsByBookingTimeAndUserId(Timestamp ticketTime, String userId) {
        return bookingRepository.findByBookingTimeAndUserId(ticketTime, userId);
    }
    
    public File generateInvoicePdf(String userId, Timestamp ticketTime,String ticketId,HttpServletRequest request) throws IOException {
        List<Booking> bookings = getBookingsByBookingTimeAndUserId(ticketTime, userId);

        Timestamp time=ticketTime;
        String formattedTicketTime = time.toLocalDateTime().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss"));
        String pdfName = "invoice_" + userId + "_" + formattedTicketTime + ".pdf";

        
        File tempFIle=File.createTempFile("invoice_", ".pdf");
        PdfWriter pdfWriter=new PdfWriter(tempFIle);
        PdfDocument pdfDocument=new PdfDocument(pdfWriter);
        Document document=new Document(pdfDocument);
        String imagePath="D:\\\\Training 2024\\\\HibernateMaven\\\\BusBookingSystem\\\\src\\\\main\\\\resources\\\\1-Mahadeshwara.jpg";
        ImageData imageData=ImageDataFactory.create(imagePath);
        Image image=new Image(imageData);
        
        float x=pdfDocument.getDefaultPageSize().getWidth()/2;
        float y=pdfDocument.getDefaultPageSize().getHeight()/2;
        image.setFixedPosition(x-150, y-170);
        image.setOpacity(0.1f);
        document.add(image);

        
        LocalDate invoiceDate=ticketTime.toLocalDateTime().toLocalDate();
        
        float threecol=290f;
        float twocol=258f;
        float twoCol150=twocol+150f;
        float twocolWidth[]= {twoCol150,twocol};
        float threeColWidth[]= {threecol,threecol,threecol};
        float fullWidth[]= {threecol*3};
        Paragraph onesp=new Paragraph("\n");
        
        
        User user=(User) request.getSession().getAttribute("user");
        
        Table table=new Table(twocolWidth);
        table.addCell(new Cell().add("Invoice").setFontSize(20f).setBorder(Border.NO_BORDER).setBold());
        Table nestedTable=new Table(new float[]{twocol/2,twocol/2});
        nestedTable.addCell(getHeaderTextCell("Invoice No."));
        nestedTable.addCell(getHeaderTextCellValue(ticketId));
        
        nestedTable.addCell(getHeaderTextCell("Invoice Date."));
        nestedTable.addCell(getHeaderTextCellValue(invoiceDate.format(DateTimeFormatter.ofPattern("dd-MM-yyyy"))));
        table.addCell(new Cell().add(nestedTable).setBorder(Border.NO_BORDER));
        
        Border gb=new SolidBorder(Color.GRAY,2f);
        Table divider=new Table(fullWidth);
        divider.setBorder(gb);
        document.add(table);
        document.add(onesp);
        document.add(divider);
        document.add(onesp);
        
        Table twoColTable=new Table(twocolWidth);
        twoColTable.addCell(getBillingandShippingCell("Ticket Information"));
        twoColTable.addCell(getBillingandShippingCell("User information"));
        document.add(twoColTable.setMarginBottom(12f));
        
        Table twoColTable2=new Table(twocolWidth);
        twoColTable2.addCell(getCell10fleft("Provider", true));
        twoColTable2.addCell(getCell10fleft("User Name", true));
        twoColTable2.addCell(getCell10fleft("SMMS bus Booking System", false));
        twoColTable2.addCell(getCell10fleft(user.getFirstName(), false));
        document.add(twoColTable2);
        
        float onecolWidth[]= {twoCol150};
        
        Table twoColTable3=new Table(onecolWidth);
        twoColTable3.addCell(getCell10fleft("Name", true));
        twoColTable3.addCell(getCell10fleft("Sachin S", false));
        document.add(twoColTable3);
        
        Table twoColTable4=new Table(onecolWidth);
        twoColTable4.addCell(getCell10fleft("Address", true));
        twoColTable4.addCell(getCell10fleft("5th cross,1st main,\nvijaynagar", false));
        twoColTable4.addCell(getCell10fleft("Email", true));
        twoColTable4.addCell(getCell10fleft("scn7653@gmail.com", false));
        document.add(twoColTable4.setMarginBottom(10f));
        
        Table tableDivider2=new Table(fullWidth);
        Border dbg=new DashedBorder(Color.GRAY,0.5f);
        document.add(tableDivider2.setBorder(dbg));
        
        Paragraph bookingText=new Paragraph("Booking Detail");
        
        document.add(bookingText.setBold());
        
        String source="",destination="",busNumber="";
        for(Booking booking : bookings) { 
        	source=booking.getSchedule().getRoute().getSource();
        	destination=booking.getSchedule().getRoute().getDestination();
        	busNumber=booking.getSchedule().getBus().getBusNumber();
        	
		}
        document.add(new Paragraph("Source: "+source));
        document.add(new Paragraph("Destination: "+destination));
        document.add(new Paragraph("Bus number: "+busNumber));

        Table threeColTable=new Table(threeColWidth);
        threeColTable.setBackgroundColor(Color.BLACK,0.7f);
        
        threeColTable.addCell(new Cell().add("Passenger Name").setBold().setFontColor(Color.WHITE).setBorder(Border.NO_BORDER));
        threeColTable.addCell(new Cell().add("Seat Number").setBold().setFontColor(Color.WHITE).setTextAlignment(TextAlignment.CENTER).setBorder(Border.NO_BORDER));
        threeColTable.addCell(new Cell().add("Price").setBold().setFontColor(Color.WHITE).setTextAlignment(TextAlignment.RIGHT).setBorder(Border.NO_BORDER)).setMarginRight(15f);
        
        document.add(threeColTable);
        
        List<BookingDetail> bookingList = new ArrayList<>();
        
        for(Booking booking : bookings) { 
        	BookingDetail bookingDt = new
        	BookingDetail(booking.getPassengerName(),booking.getSeatNumber(),(int)booking.
		  getSchedule().getRoute().getPrice());
		 
		  bookingList.add(bookingDt); 
		}
        
        Table threeColTable2=new Table(threeColWidth);
        int totalSum=0;
        for(BookingDetail detail:bookingList) {
        	int total=detail.getPrice();
        	totalSum+=total;
        	
        	threeColTable2.addCell(new Cell().add(detail.getPassengerName()).setBorder(Border.NO_BORDER).setMarginLeft(10f));
        	threeColTable2.addCell(new Cell().add(String.valueOf(detail.getSeatNumber())).setTextAlignment(TextAlignment.CENTER).setBorder(Border.NO_BORDER));
        	threeColTable2.addCell(new Cell().add(String.valueOf(total)).setTextAlignment(TextAlignment.RIGHT).setBorder(Border.NO_BORDER).setMarginRight(15f));

        }
        
        document.add(threeColTable2.setMarginBottom(20f));
        
        float onetwo[]= {threecol+125f,threecol*2};
        Table threcolTable3=new Table(onetwo);
        threcolTable3.addCell(new Cell().add("")).setBorder(Border.NO_BORDER);
        threcolTable3.addCell(new Cell().add(tableDivider2)).setBorder(Border.NO_BORDER);
        
        document.add(threcolTable3);
        
        Table threecolTable4=new Table(threeColWidth);
        threecolTable4.addCell(new Cell().add("").setBorder(Border.NO_BORDER).setMarginLeft(10f));
        threecolTable4.addCell(new Cell().add("Total price:").setTextAlignment(TextAlignment.CENTER).setBorder(Border.NO_BORDER));
        threecolTable4.addCell(new Cell().add(String.valueOf(totalSum)).setTextAlignment(TextAlignment.RIGHT).setBorder(Border.NO_BORDER).setMarginRight(15f));

        document.add(threecolTable4);
        document.add(tableDivider2);
        document.add(new Paragraph("\n"));
        document.add(divider.setBorder(new SolidBorder(Color.GRAY,1)).setMarginBottom(15f));
        
        Table tb=new Table(fullWidth);
        tb.addCell(new Cell().add("Terms and conditions\n").setBold().setBorder(Border.NO_BORDER));
        
        List<String> termsAndCondition=new ArrayList<String>();
        termsAndCondition.add("1.You should mandatorily bring this ticket for the confirmation");
        termsAndCondition.add("2. You have to be in the source point on or before the departure time of the bus");
        
        for(String tnc:termsAndCondition) {
        	tb.addCell(new Cell().add(tnc).setBorder(Border.NO_BORDER));
        }
        
        document.add(tb);
        
        document.close();
        return tempFIle;
        
		/*
		 * File tempFile = File.createTempFile("invoice_", ".pdf");
		 * CodingErrorPdfInvoiceCreator pdfCreator = new
		 * CodingErrorPdfInvoiceCreator(tempFile.getAbsolutePath());
		 * pdfCreator.createDocument();
		 * 
		 * 
		 * LocalDate invoiceDate=ticketTime.toLocalDateTime().toLocalDate(); // Create
		 * Header HeaderDetails header = new HeaderDetails();
		 * header.setInvoiceNo(ticketId)
		 * .setInvoiceDate(invoiceDate.format(DateTimeFormatter.ofPattern("dd-MM-yyyy"))
		 * ) .setInvoiceTitle("SMMS").build(); pdfCreator.createHeader(header);
		 * 
		 * // Create Address AddressDetails addressDetails = new AddressDetails();
		 * addressDetails.setBillingCompany("Bus Booking System")
		 * .setBillingCompanyText("Provider") .setBillingName("User ID: " + userId)
		 * .setBillingAddress("5th cross,1st main\nVijaynagar")
		 * .setBillingEmail("scn7654@gmail.com") .build();
		 * pdfCreator.createAddress(addressDetails);
		 * 
		 * // Create Product Table Header ProductTableHeader productTableHeader = new
		 * ProductTableHeader(); productTableHeader.setDescription("PassengerName")
		 * .setQuantity("SeatNumber").setPrice("Price").build();
		 * 
		 * pdfCreator.createTableHeader(productTableHeader);
		 * 
		 * // Create Product List List<Product> productList = new ArrayList<>(); for
		 * (Booking booking : bookings) { Product product = new
		 * Product(booking.getPassengerName(),booking.getSeatNumber(),(int)booking.
		 * getSchedule().getRoute().getPrice());
		 * 
		 * productList.add(product); }
		 * productList=pdfCreator.modifyProductList(productList);
		 * pdfCreator.createProduct(productList);
		 * 
		 * // Create Terms and Conditions List<String> tncList = new ArrayList<>();
		 * tncList.
		 * add("1. The Seller shall not be liable to the Buyer directly or indirectly for any loss or damage suffered by the Buyer."
		 * ); tncList.
		 * add("2. The Seller warrants the product for one (1) year from the date of shipment."
		 * ); String
		 * imagePath="D:\\Training 2024\\HibernateMaven\\BusBookingSystem\\src\\main\\resources\\1-Mahadeshwara.jpg"
		 * ; pdfCreator.createTnc(tncList, false, imagePath);
		 * 
		 * 
		 * return tempFile;
		 */
    } 
    
    static Cell getHeaderTextCell(String textValue) {
    	return new Cell().add(textValue).setBold().setBorder(Border.NO_BORDER).setTextAlignment(TextAlignment.RIGHT);
    	
    }
    
    static Cell getHeaderTextCellValue(String textValue) {
    	return new Cell().add(textValue).setBorder(Border.NO_BORDER).setTextAlignment(TextAlignment.LEFT);
    	
    }
    
    static Cell getBillingandShippingCell(String textValue) {
    	return new Cell().add(textValue).setFontSize(12f).setBold().setBorder(Border.NO_BORDER).setTextAlignment(TextAlignment.LEFT);
    }
    
    static Cell getCell10fleft(String textValue,Boolean isBold) {
    	Cell myCell=new Cell().add(textValue).setFontSize(10f).setBorder(Border.NO_BORDER).setTextAlignment(TextAlignment.LEFT);
    	return isBold ?myCell.setBold():myCell;
    }

	public void processBooking(String scheduleId, String price, String paymentMethod, List<String> passengerNames,
			List<Integer> seats, User user,HttpServletRequest request,List<String> gender) {
		 Schedule schedule = scheduleService.findById(scheduleId);
	        Timestamp bookingTime = new Timestamp(System.currentTimeMillis());
	        Bus bus = schedule.getBus();

	        int totalPassenger = passengerNames.size();
	        int totalSeats = seats.size();
	        LocalDate time = bookingTime.toLocalDateTime().toLocalDate();

	        
	        for (int i = 0; i < passengerNames.size(); i++) {
	            Booking booking = new Booking();
	            booking.setSchedule(schedule);
	            booking.setUser(user);
	            booking.setPassengerName(passengerNames.get(i));
	            booking.setSeatNumber(seats.get(i));
	            booking.setBookingTime(bookingTime);
	            booking.setGender(gender.get(i));
	           
	            request.getSession().setAttribute("source", booking.getSchedule().getRoute().getSource());
	            request.getSession().setAttribute("destination", booking.getSchedule().getRoute().getDestination());
	            request.getSession().setAttribute("busnumber", booking.getSchedule().getBus().getBusNumber());
	            
	            
	            bookingRepository.save(booking);

	            Payment payment = new Payment();
	            payment.setBooking(booking);
	            payment.setAmount(Double.parseDouble(price));
	            payment.setPaymentMethod(paymentMethod);
	            payment.setPaymentDate(Date.valueOf(time));

	            paymentRepository.save(payment);
	        }

	        Ticket ticket = new Ticket();
	        ticket.setTicketTime(bookingTime);
	        ticket.setUser(user);
	        ticket.setTotalPassenger(totalPassenger);
	        ticket.setTotalSeats(totalSeats);

	        ticketRepository.save(ticket);

	        bus.setSeat_available(bus.getSeat_available() - seats.size());
	        busService.save(bus);
		
	}

	public void cancelBooking(String userId, Timestamp time) {
		List<Booking> bookings=getBookingsByBookingTimeAndUserId(time, userId);
		Ticket ticket=ticketRepository.findByTicketTimeAndUserId(time,userId);
		for(Booking book:bookings) {
			book.setStatus("cancelled");
			Bus bus=book.getSchedule().getBus();
			bus.setSeat_available(bus.getSeat_available() +1);
			busService.save(bus);
			bookingRepository.save(book);
			
			ticket.setStatus("cancelled");
			ticketRepository.save(ticket);
		}
		
	}
    
    
}

class BookingDetail{
	private String passengerName;
	private int seatNumber;
	private int price;
	
	
	public BookingDetail(String passengerName, int seatNumber, int price) {
		super();
		this.passengerName = passengerName;
		this.seatNumber = seatNumber;
		this.price = price;
	}
	public String getPassengerName() {
		return passengerName;
	}
	public void setPassengerName(String passengerName) {
		this.passengerName = passengerName;
	}
	public int getSeatNumber() {
		return seatNumber;
	}
	public void setSeatNumber(int seatNumber) {
		this.seatNumber = seatNumber;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
	
}

