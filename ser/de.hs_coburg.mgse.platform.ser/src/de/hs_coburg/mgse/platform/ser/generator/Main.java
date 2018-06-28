/*
 * generated by Xtext 2.12.0
 */
package de.hs_coburg.mgse.platform.ser.generator;

import com.google.inject.Inject;
import com.google.inject.Injector;
import com.google.inject.Provider;
import de.hs_coburg.mgse.platform.ser.SERModelStandaloneSetup;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.xtext.generator.GeneratorContext;
import org.eclipse.xtext.generator.GeneratorDelegate;
import org.eclipse.xtext.generator.JavaIoFileSystemAccess;
import org.eclipse.xtext.util.CancelIndicator;
import org.eclipse.xtext.validation.CheckMode;
import org.eclipse.xtext.validation.IResourceValidator;
import org.eclipse.xtext.validation.Issue;

public class Main {

	public static void main(String[] args) {
		if (args.length < 2) {
			System.err.println("Aborting: no path to EMF resource provided!");
			System.err.println("You have to provide a source and destination directory.");
			return;
		}
		Injector injector = new SERModelStandaloneSetup().createInjectorAndDoEMFRegistration();
		Main main = injector.getInstance(Main.class);
		main.runGenerator(args[0], args[1]);
	}

	@Inject
	private Provider<ResourceSet> resourceSetProvider;

	@Inject
	private IResourceValidator validator;

	@Inject
	private GeneratorDelegate generator;

	@Inject 
	private JavaIoFileSystemAccess fileAccess;

	protected void runGenerator(String in, String out) {	
		Collection<Path> coursePaths = new HashSet<Path>();
		try {
			Files.walk(Paths.get(in))
				.filter(Files::isRegularFile)
				.filter(p -> 	p.toString().endsWith(".courses")	||
								p.toString().endsWith(".glossary")	||
								p.toString().endsWith(".spo"))
				.forEach(p -> coursePaths.add(p));
		} catch (IOException e) {
			e.printStackTrace();
			System.err.println("Error");
			System.exit(1);
		}
		
		Path outputPath = Paths.get(out);
		
		// Load the resources
		ResourceSet set = resourceSetProvider.get();
		for(Path resourcePath : coursePaths) {
			URI uri = URI.createFileURI(resourcePath.toString());
			set.getResource(uri, true);
		}
		
		runGenerator(set, outputPath);
	}
	
	protected void runGenerator(ResourceSet resourceSet, Path outputPath) {
		for(Resource resource: resourceSet.getResources()) {
			// Validate the resource
			List<Issue> list = validator.validate(resource, CheckMode.ALL, CancelIndicator.NullImpl);
			if (!list.isEmpty()) {
				for (Issue issue : list) {
					System.err.println(issue);
				}
				return;
			}

			// Configure and start the generator
			fileAccess.setOutputPath(outputPath.toString());
			GeneratorContext context = new GeneratorContext();
			context.setCancelIndicator(CancelIndicator.NullImpl);
			generator.generate(resource, fileAccess, context);
		}
		System.out.println("Code generation finished. (" + resourceSet.getResources() +")");
	}
}
